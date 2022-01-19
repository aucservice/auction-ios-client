//
//  AppViewModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation
import Combine
import SwiftUI

enum TabBarSection {
    case list
    case profile
}

class AppViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    @Published var currentBids = [BidModel]()
    
    @Published var currentUser: UserAndLotsModel = UserAndLotsModel(username: "", lots: [])
    
    @Published var allUsers = [String]()
    
    @Published var allLots = [LotModelMapper]()
    
    @Published var selectedTab: TabBarSection = .list
    
    var signalRService = SignalRService()
    
    private var disposeBag = Set<AnyCancellable>()
    
    init() {
        processUserLoggedInStatus()
        getAllUsers()
        getCurrentUser()
        
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
                let model = users.map { UserModel(username:  $0, password: "") }
                self.signalRService.handleUsersUpdate(user: model)
            }.store(in: &disposeBag)
        
        signalRService.lotsHasChanged = { lots in
            self.allLots = lots
        }
        
        signalRService.lotsBidIsOver = { lotId in
            self.allLots.removeAll(where: { $0.id == lotId })
        }
    }
    
    func processUserLoggedInStatus() {
        let status = UserDefaults.standard.bool(forKey: "isLoggedIn")
        self.isLoggedIn = status
    }
    
    func getAllUsers() {
        UserService.shared.getAllUsers { result in
            switch result {
            case .success(let usersModel):
                self.allUsers = usersModel.username
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func getCurrentUser() {
        guard let username = UserDefaults.standard.string(forKey: "username") else { return }
        UserService.shared.getUser(by: username) { result in
            switch result {
            case .success(let userModel):
                self.currentUser = userModel
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
