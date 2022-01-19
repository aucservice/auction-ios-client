//
//  AuctionApp.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import Combine
import SwiftUI
import UserNotifications

// AppDelegate.swift
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Here we actually handle the notification
        print("Notification received with identifier \(notification.request.identifier)")
        // So we call the completionHandler telling that the notification should display a banner and play the notification sound - this will happen while the app is in foreground
        completionHandler([.banner, .sound])
    }
}

@main
struct AuctionApp: App{
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
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
