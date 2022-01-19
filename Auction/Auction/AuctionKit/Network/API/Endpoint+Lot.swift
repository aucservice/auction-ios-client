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
        guard let authToken = UserDefaults.standard.string(forKey: "authToken")
        else {
            return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                            method: .post,
                            path: "/Auction/bid",
                            body: ["name" : username,
                                   "lotId" : lotId,
                                   "amount" : price])
        }
        return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                        method: .post,
                        path: "/Auction/bid",
                        body: ["name" : username,
                               "lotId" : lotId,
                               "amount" : price,
                               "token" : authToken])
    }
    
    static func getLot(by id: String) -> Self {
        let query =  ["lotId" : id]
        return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                        method: .get,
                        path: "/Auction/lot",
                        queryItems: query.queryItems)
    }
    
    static func getAllLots() -> Self {
        return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                        method: .get,
                        path: "/Auction/lots")
    }
}
