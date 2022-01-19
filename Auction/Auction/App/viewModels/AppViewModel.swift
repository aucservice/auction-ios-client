//
//  AppViewModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation
import Combine
import SwiftUI

class AppViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    @Published var currentBids = [BidModel]()
    
    @Published var currentUser: UserAndLotsModel = UserAndLotsModel(username: "", lots: [])
    
    @Published var allUsers = [UserAndLotsModel]()
    
    @Published var allLots = [LotModel]()
    
    var signalRService = SignalRService()
    
    private var disposeBag = Set<AnyCancellable>()
    
    init() {
        processUserLoggedInStatus()
        
        $allLots
            .receive(on: DispatchQueue.main)
            .sink { [weak self] lots in
                guard let self = self else { return }
                self.signalRService.handleLotsUpdate(lots: lots)
            }.store(in: &disposeBag)
        
        $allUsers
            .receive(on: DispatchQueue.main)
            .sink { [weak self] users in
                guard let self = self else { return }
                let model = users.map { UserModel(username:  $0.username, password: "") }
                self.signalRService.handleUsersUpdate(user: model)
            }.store(in: &disposeBag)
    }
    
    func processUserLoggedInStatus() {
        let status = UserDefaults.standard.bool(forKey: "isLoggedIn")
        self.isLoggedIn = status
    }
    
    func getAllUsers() {
        UserService.shared.getAllUsers { result in
            switch result {
            case .success(let usersModel):
                guard let username = UserDefaults.standard.string(forKey: "username"),
                      let currentUser = usersModel.first(where: { $0.username == username})
                else { return }
                self.currentUser = currentUser
                self.allUsers = usersModel
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
