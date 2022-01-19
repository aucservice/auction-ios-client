//
//  LotModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

struct LotModel: Codable {
    var id: String
    var title: String
    var imageURL: String
    var description: String
    var bidEnd: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case imageURL = "tmageUrl"
        case description = "description"
        case bidEnd = "bidding_end"
    }
}
