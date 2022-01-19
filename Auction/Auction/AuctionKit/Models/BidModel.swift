//
//  BidModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

struct BidModel: Codable {
    var lotId: String
    var userName: String
    var price: Int
    var time: Int
    
    enum CodingKeys: String, CodingKey {
        case lotId = "lot_id"
        case userName = "username"
        case price = "amount"
        case time = "timestamp"
    }
}
