//
//  ProfileViewModel.swift
//  Auction
//
//  Created by Adam Bokun on 19.01.22.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var usersLots = UserAndLotsModel(from: [Lots])
    
    func getUserProfile() {
        
        UserService.shared.getUser(by: "username") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let model):
                var lotsModel = UserAndLotsModel()
                for lot in model {
                    lotsModel.append(lot)
                }
                self.yourLots.append(contentsOf: lotsModel)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
            
        }
        
        //    func fetchAllLots() {
        //        LotService.shared.getAllLots { [weak self] result in
        //            guard let self = self else { return }
        //
        //            switch result {
        //            case .success(let model):
        //                var lotsModel = [LotModel]()
        //                for (_,lot) in model {
        //                    lotsModel.append(lot)
        //                }
        //                self.lotsList.append(contentsOf: lotsModel)
        //            case .failure(let error):
        //                debugPrint(error.localizedDescription)
        //            }
        //        }
        //    }
    }
}
