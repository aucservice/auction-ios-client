//
//  SignalRService.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SignalRClient

final class SignalRService {
    private var connection: HubConnection
    
    public init(url: URL) {
        connection = HubConnectionBuilder(url: url).withLogging(minLogLevel: .debug).build()
        connection.on(method: "MethodТame") { (lotId: Int, userId: Int, price: Int) in
            do {
                self.handleSignal(lotId: lotId, userId: userId, price: price)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func handleSignal(lotId: Int, userId: Int, price: Int) {
        
    }
}
