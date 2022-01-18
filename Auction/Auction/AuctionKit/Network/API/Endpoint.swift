//
//  Endpoint.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import UIKit

struct Endpoint {
    var baseURL: String
    var method: HTTPMethod
    var path: String
    var queryItems: [URLQueryItem]?
    var body: [String: Any]?
    var url: URL {
      guard var components = URLComponents(string: baseURL + path) else {
            preconditionFailure("Invalid server URL")
        }
        
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
    var headers: [String: Any] {
        var headers = [
            "Accept": "*/*",
            "Content-Type": "application/json",
            "Device": UIDevice.current.userInterfaceIdiom == .pad ? "ipad" : "ios_iphone"
        ]

        if let authToken = UserDefaults.standard.string(forKey: "authToken") {
            headers["Authorization"] = "Bearer \(authToken)"
        }

        return headers
    }
}

