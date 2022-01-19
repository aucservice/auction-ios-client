//
//  AuctionApp.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import SwiftUI

@main
struct AuctionApp: App {
    
    @StateObject var appViewModel: AppViewModel
    
    init() {
        self._appViewModel = StateObject(wrappedValue: AppViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            switch appViewModel.isLoggedIn {
            case true:
                ItemsView()
                    .environmentObject(appViewModel)
            case false:
                NavigationView {
                    SignUpView()
                        .environmentObject(appViewModel)
                }
            }
        }
    }
}
