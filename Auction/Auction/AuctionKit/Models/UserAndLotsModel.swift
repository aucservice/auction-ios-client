//
//  UserAndLotsModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

struct AllUsersModel: Codable {
    var username: [String]
    
    enum CodingKeys: String, CodingKey {
        case username = "users"
    }
}


struct UserAndLotsModel: Codable {
    var username: String
    var lots: [LotModel]
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case lots = "lots"
    }
}
