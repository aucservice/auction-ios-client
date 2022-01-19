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
                        method: .put,
                        path: "/Auction/user",
                        queryItems: ["name" : id].queryItems)
    }
    
    static func getAllUsers() -> Self {
        guard let authToken = UserDefaults.standard.string(forKey: "authToken") else {
            return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                            method: .get,
                            path: "/Auction/users")
        }
        return Endpoint(baseURL: "https://auc-service.herokuapp.com",
                        method: .get,
                        path: "/Auction/users",
                        queryItems: ["token" : authToken].queryItems)
    }
}
