//
//  UserService.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    private init() {}
    
    public func getUser(by name: String,
                        _ callback: @escaping (Result<UserAndLotsModel, Error>) -> Void) {
        let endpoint = Endpoint.getUser(by: name)
        
        Network.makeRequest(type: UserAndLotsModel.self, endpoint: endpoint)
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
    
    public func getAllUsers(_ callback: @escaping (Result<AllUsersModel, Error>) -> Void) {
        
        let endpoint = Endpoint.getAllUsers()
        
        Network.makeRequest(type: AllUsersModel.self, endpoint: endpoint)
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
