//
//  Dictionary+Extension.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

extension Dictionary {
    func data() -> Data? {
        guard let httpBody = try? JSONSerialization.data(withJSONObject: self, options: []) else {
            return nil
        }
        return httpBody
    }

    mutating func addToDictIfExists(key: Key, value: Value?) {
        guard let value = value else { return }

        self[key] = value
    }
}

extension Dictionary {
    var queryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = []

        for item in self {
            guard let key = item.key as? String else { continue }

            if let value = item.value as? Int {
                queryItems += [URLQueryItem(name: key, value: "\(value)")]
            } else if let value = item.value as? Bool {
                queryItems += [URLQueryItem(name: key, value: value ? "true" : "false")]
            } else if let value = item.value as? String {
                queryItems += [URLQueryItem(name: key, value: "\(value)")]
            } else {
                queryItems += [URLQueryItem(name: key, value: "\(item.value)")]
            }
        }

        return queryItems
    }
}
