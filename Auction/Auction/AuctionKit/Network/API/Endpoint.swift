//
//  Endpoint.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import UIKit

struct Endpoint {
    var method: HTTPMethod
    var path: String
    var queryItems: [URLQueryItem]?
    var body: [String: Any]?
    var url: URL {
      guard var components = URLComponents(string: "base url") else {
            preconditionFailure("Invalid server URL")
        }

        //components.path = "/api" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
    var headers: [String: Any] {
        var headers = [
            "Accept": "*/*",
            "Accept-Encoding": "gzip",
            "Content-Encoding": "gzip",
            "Connection": "keep-alive",
            "Content-Type": "application/json",
            "Web-Customer": "true",
            "Device": UIDevice.current.userInterfaceIdiom == .pad ? "ipad" : "ios_iphone"
        ]

        if let authToken = UserDefaults.standard.string(forKey: "authToken") {
            headers["Authentication-Token"] = authToken
        }

        return headers
    }
}

