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

class LotModelMapper: ObservableObject, Equatable, Identifiable {

    @Published var id: String = ""
    @Published var title: String = ""
    @Published var imageURL: String = ""
    @Published var description: String = ""
    @Published var bidEnd: Int = 0
    @Published var price: Int = 100
    
    init(api: LotModel) {
        id = api.id
        title = api.title
        imageURL = api.imageURL
        description = api.description
        bidEnd = api.bidEnd
        price = api.price
    }
    
    init(id: String,
         title: String,
         imageUrl: String,
         description: String,
         bidEnd: Int,
         price: Int) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.description = description
        self.bidEnd = bidEnd
        self.price = price
    }
    
    static func == (lhs: LotModelMapper, rhs: LotModelMapper) -> Bool {
        lhs.id == rhs.id
    }
}
