//
//  AsyncImage.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation
import Kingfisher
import SwiftUI

@ViewBuilder func KingfisherImage(urlString: String) -> KFImage {
  KFImage.url(URL(string: urlString))
    .resizable()
    .placeholder {
        ZStack(alignment: .center) {
            Text("No image")
                .foregroundColor(.black)
        }
    }
    .scaleFactor(UIScreen.main.scale)
    .backgroundDecode()
    .loadDiskFileSynchronously()
    .cacheMemoryOnly()
    .fade(duration: 0.25)
    .onProgress { _, _ in }
    .onSuccess { _ in}
    .onFailure { _ in }
}
