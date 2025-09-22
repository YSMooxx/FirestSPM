//
//  NetworkManager.swift
//  FirstSwiftPackage
//
//  Created by new on 2025/9/22.
//

import Foundation
import Alamofire

actor NetworkManager {
    public static let shared = NetworkManager()
    
    private init() {}
    
    public func fetchData(from url: String) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}


