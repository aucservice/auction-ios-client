//
//  UserModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation

class UserModel: Codable {
    var username: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password_hash"
    }
}
