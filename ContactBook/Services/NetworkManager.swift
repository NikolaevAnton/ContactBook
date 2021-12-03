//
//  NetworkManager.swift
//  ContactBook
//
//  Created by Anton Nikolaev on 03.12.2021.
//

import Foundation
import Alamofire
import AlamofireImage

class NetworkManager {
    static let shared = NetworkManager()
    
    private init(){}
    
    private let urlParams = [
        "results":"\(15)",
    ]
    
    func fetchUsers(_ completion: @escaping (Result<[User], AFError>) -> Void) {
        AF.request(URLConstants.randomUserAPI.rawValue, parameters: urlParams)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let users = User.getRandomUsers(from: value)
                    completion(.success(users))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func fetchData(from url: String, completion: @escaping (Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { responce in
                switch responce.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure((error)))
                }
            }
    }
}
