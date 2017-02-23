//
//  Network.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unknown
}
enum Result<T> {
    case success(T)
    case failure(Error)
}

class Network: NetworkProtocol {
    func getSimpleProducts(completion: (Result<ProductSimpleContainer>) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: "ProductSimple", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    let productSimpleContainer = ProductSimpleContainer(json: object)
                    return completion(.success(productSimpleContainer))
                } else if let _ = json as? [Any] {
                    return completion(.failure(NetworkError.unknown))
                } else {
                    return completion(.failure(NetworkError.unknown))
                }
            } else {
                return completion(.failure(NetworkError.unknown))
            }
        } catch {
            return completion(.failure(NetworkError.unknown))
        }
    }
}
