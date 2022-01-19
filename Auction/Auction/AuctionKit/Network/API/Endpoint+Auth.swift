//
//  Endpoint+Auth.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

extension Endpoint {
    
    static func logIn(with model: LoginModel) -> Self {
        return Endpoint(baseURL: "https://aucservice.fpmi.spiralarms.org",
                        method: .post,
                        path: "/login",
                        body: ["password": model.password,
                               "username": model.username ])
    }

    static func signUp(with model: SignupModel) -> Self {
        return Endpoint(baseURL: "https://aucservice.fpmi.spiralarms.org",
                        method: .post,
                        path: "/register",
                        body: ["username": model.username,
                               "password": model.password])
    }
}
