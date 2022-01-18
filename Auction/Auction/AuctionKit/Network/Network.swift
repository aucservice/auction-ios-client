//
//  Network.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class Network {
    class func makeRequest<T: Decodable>(type: T.Type, endpoint: Endpoint)
    -> Publishers.Decode<Publishers.Map<URLSession.DataTaskPublisher, Data>, T, JSONDecoder> {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body?.data()

        endpoint.headers.forEach({ (key, value) in
            if let value = value as? String {
                request.setValue(value, forHTTPHeaderField: key)
            }
        })

        return URLSession.shared.dataTaskPublisher(for: request)
            .map({ (data, response) -> Data in
                #if !(RELEASE)
                debugPrint("request: \(request)\nresponse: \(response)\n")
                #endif
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
    }
}

extension AnyPublisher {
    func request(completion: @escaping ((Result<Output, Error>) -> Void)) {
        sink(
            receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                case .finished: break
                }
            },
            receiveValue: { result in
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }
        )
            .store(in: &subscriptions)
    }
}
