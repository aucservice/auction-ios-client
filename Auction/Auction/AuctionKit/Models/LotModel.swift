//
//  LotModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SwiftUI

struct LotModel: Codable, Identifiable, Equatable {
    var id: String
    var title: String
    var imageURL: String
    var description: String
    var bidEnd: Int
    var price: Int = 100
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case imageURL = "image_url"
        case description = "description"
        case bidEnd = "bidding_end"
    }
}
