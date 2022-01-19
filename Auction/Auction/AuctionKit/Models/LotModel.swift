//
//  LotModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SwiftUI

struct LotModel: Codable, Identifiable {
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
