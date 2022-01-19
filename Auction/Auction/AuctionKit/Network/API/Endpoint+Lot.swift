//
//  Endpoint+Lot.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation

// TODO: - change base url
extension Endpoint {
    
    static func makeBid(username: String, lotId: String, price: Int) -> Self {
        return Endpoint(baseURL: "baseURL",
                        method: .post,
                        path: "/Auction/bid",
                        body: ["username" : username,
                               "lotId" : lotId,
                               "amount" : price])
    }
    
    static func getLot(by id: String) -> Self {
        return Endpoint(baseURL: "baseURL",
                        method: .get,
                        path: "/Auction/lot",
                        body: ["lotId" : id])
    }
    
    static func getAllLots() -> Self {
        return Endpoint(baseURL: "baseUrl",
                        method: .get,
                        path: "/Auction/lots")
    }
}
