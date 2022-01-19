//
//  SignalRService.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SignalRClient
import SwiftUI

final class SignalRService {
    
    private var connection: HubConnection?
    
    private var allLots = [LotModel]()
    
    private var allUsers = [UserModel]()
    
    var lotsHasChanged: (([LotModel]) -> Void)? = nil
    
    init() {
        if let url = URL(string: "https://auc-service.herokuapp.com/auctionhub") {
            connection = HubConnectionBuilder(url: url).withLogging(minLogLevel: .debug).build()
            // lot has changed
            connection?.start()
            
            connection?.on(method: "bid") { (userName: String, lotId: String, amount: Int) in
                do {
                    self.handleSignal(lotId: lotId, userId: userName, price: amount)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            
            // lot is over
            connection?.on(method: "bid-end") { (lotId: String) in
                do {
                    self.handleLotOver(lotId: lotId)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func handleSignal(lotId: String, userId: String, price: Int) {
        guard let lot = allLots.first(where: { $0.id == lotId }),
              let user = allUsers.first(where: { $0.username == userId }),
              let lotIdx = allLots.firstIndex(of: lot)
        else {
            return
        }
        
        allLots[lotIdx] = LotModel(id: lot.id, title: lot.title, imageURL: lot.imageURL, description: lot.description, bidEnd: lot.bidEnd, price: price)
        lotsHasChanged!(allLots)
        LocalNotification.shared.sendNotification(name: lot.title, price: price, username: user.username)
    }
    
    func handleLotOver(lotId: String) {
        guard let lot = allLots.first(where: { $0.id == lotId })
        else {
            return
        }
        LocalNotification.shared.bidOver(lotName: lot.title)
    }
    
    func handleLotsUpdate(lots: [LotModel]) {
        self.allLots = lots
    }
    
    func handleUsersUpdate(user: [UserModel]) {
        self.allUsers = user
    }
}
