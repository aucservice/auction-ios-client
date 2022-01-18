//
//  AlertContent.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

struct AlertContent: Identifiable {
    var id: UUID {
        UUID()
    }

    var content: String
    var completion: (() -> Void)?
}
