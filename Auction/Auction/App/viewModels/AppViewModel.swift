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
    
    func processUserLoggedInStatus() {
        let status = UserDefaults.standard.bool(forKey: "isLoggedIn")
        self.isLoggedIn = status
    }
}
