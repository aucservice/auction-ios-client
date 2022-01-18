//
//  LotModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

struct LotModel: Codable {
    var id: Int
    var title: String
    var imageURL: String
    var description: String
    var bidEnd: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case imageURL = "ImageUrl"
        case description = "Description"
        case bidEnd = "Bidding_end"
    }
}
