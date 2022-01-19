//
//  LotService.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation

class LotService {
    
    static let shared = LotService()
    
    private init() {}
    
    public func makeBid(username: String, lotId: String, price: Int,
                        _ callback: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = Endpoint.makeBid(username: username, lotId: lotId, price: price)
        
        Network.makeRequest(type: String.self, endpoint: endpoint)
            .eraseToAnyPublisher()
            .request { result in
                switch result {
                case .success(let response):
                    debugPrint(response)
                    callback(.success(()))
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    callback(.failure(error))
                }
            }
    }
    
    public func getLot(by id: String,
                       _ callback: @escaping (Result<LotModel, Error>) -> Void) {
        
        let endpoint = Endpoint.getLot(by: id)
        
        Network.makeRequest(type: LotModel.self, endpoint: endpoint)
            .eraseToAnyPublisher()
            .request { result in
                switch result {
                case .success(let response):
                    debugPrint(response)
                    callback(.success(response))
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    callback(.failure(error))
                }
            }
    }
    
    public func getAllLots(_ callback: @escaping (Result<[String:LotModel], Error>) -> Void) {
        
        let endpoint = Endpoint.getAllLots()
        
        Network.makeRequest(type: [String:LotModel].self, endpoint: endpoint)
            .eraseToAnyPublisher()
            .request { result in
                switch result {
                case .success(let response):
                    debugPrint(response)
                    callback(.success(response))
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    callback(.failure(error))
                }
            }
    }
}
