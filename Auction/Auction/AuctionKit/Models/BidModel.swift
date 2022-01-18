//
//  BidModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

struct BidModel: Codable {
    var lotId: Int
    var userName: String
    var price: Int
    var time: Int
    
    enum CodingKeys: String, CodingKey {
        case lotId = "Lot_Id"
        case userName = "UserName"
        case price = "Amount"
        case time = "Timestamp"
    }
}
