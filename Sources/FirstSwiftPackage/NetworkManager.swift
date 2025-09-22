//
//  NetworkManager.swift
//  FirstSwiftPackage
//
//  Created by new on 2025/9/22.
//

import Foundation
import Alamofire

public actor NetworkManager {
    public static let shared = NetworkManager()
    
    private init() {}
    
    public func fetchData(from url: String,suc:@escaping @Sendable (_ data:Data) -> (),fail:@escaping @Sendable (_ error:Error) -> ()) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    suc(data)
                case .failure(let error):
                    fail(error)
                }
            }
        }
    }
}


