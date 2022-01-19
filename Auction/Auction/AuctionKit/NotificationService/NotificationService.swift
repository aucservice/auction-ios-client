//
//  NotificationService.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation
import UserNotifications

class LocalNotification {

    static let shared = LocalNotification()
    let notificationCenter = UNUserNotificationCenter.current()

    private init() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, _) in

            guard granted else { return }
            self.notificationCenter.getNotificationSettings { (settings) in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
    }

    func sendNotification(name: String, price: Int, username: String) {
        let content = UNMutableNotificationContent()
        content.title = name
        content.body = "The price has beated by \(username) with \(price)$!"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            print(error?.localizedDescription ?? "")
        }
    }
    
    func bidOver(lotName: String) {
        let content = UNMutableNotificationContent()
        content.title = lotName
        content.body = "Lot are over"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            print(error?.localizedDescription ?? "")
        }
    }
}
