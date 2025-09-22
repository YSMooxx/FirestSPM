//
//  NetworkManager.swift
//  FirstSwiftPackage
//
//  Created by new on 2025/9/22.
//

import Foundation
import Alamofire

public class NetworkManager {
    @MainActor public static let shared = NetworkManager()
    
    private init() {}
    
    public func fetchData(from url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


