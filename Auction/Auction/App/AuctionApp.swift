//
//  AuctionApp.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import Combine
import SwiftUI
import UserNotifications

@main
struct AuctionApp: App{
    
    
    @StateObject var appViewModel: AppViewModel
    
    init() {
        self._appViewModel = StateObject(wrappedValue: AppViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            switch appViewModel.isLoggedIn {
            case true:
                TabView(selection: $appViewModel.selectedTab) {
                    NavigationView {
                    ItemsView()
                        .environmentObject(appViewModel)
                    }
                    .tag(TabBarSection.list)
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                    
                    ProfileView()
                        .environmentObject(appViewModel)
                        .tag(TabBarSection.profile)
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                        }
                }
                
            case false:
                NavigationView {
                    SignUpView()
                        .environmentObject(appViewModel)
                }
            }
        }
    }
}
