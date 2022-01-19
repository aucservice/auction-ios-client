//
//  AuthServicer.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation

class AuthService {
    
    static var shared = AuthService()
    
    private init() {}
    
    public func login(username: String, password: String,
                      _ callback: @escaping (Result<String, Error>) -> Void) {
        let endPoint = Endpoint.logIn(with: LoginModel(username: username,
                                                       password: password))
        
        Network.makeRequest(type: AuthResponse.self, endpoint: endPoint)
            .eraseToAnyPublisher()
            .request { result in
                switch result {
                case .success(let response):
                    UserDefaults.standard.set(response.token, forKey: "authToken")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    debugPrint(response.message)
                    callback(.success(response.message))
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    callback(.failure(error))
                }
            }
    }
    
    public func signUp(username: String, password: String,
                      _ callback: @escaping (Result<String, Error>) -> Void) {
        let endPoint = Endpoint.signUp(with: SignupModel(username: username,
                                                       password: password))
        
        Network.makeRequest(type: AuthResponse.self, endpoint: endPoint)
            .eraseToAnyPublisher()
            .request { result in
                switch result {
                case .success(let response):
                    UserDefaults.standard.set(response.token, forKey: "authToken")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    callback(.success(response.message))
                    debugPrint(response.message)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    callback(.failure(error))
                }
            }
    }
    
}
