//
//  Endpoint+User.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation

extension Endpoint {
    
    static func getUser(by id: String) -> Self {
        return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                        method: .get,
                        path: "/Auction/user",
                        body: ["username" : id])
    }
    
    static func getAllUsers() -> Self {
        return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                        method: .get,
                        path: "/Auction/users")
    }
}
