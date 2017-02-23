//
//  Network.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

enum NetworkError: Error {
    case unknown
}
enum Result<T> {
    case success(T)
    case failure(Error)
}

class Network: NetworkProtocol {
    let baseUrl = "https://api.johnlewis.com/v1"
    let search = "/products/search"
    let secretKey = "Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
    let header = "https:"
    
    //Parameters
    let searchKey = "q"
    let key = "key"
    let pageSize = "pageSize"
    

    
    func setSearchParameters(searchString: String, pageSize: String) -> Parameters {
        return [searchKey: searchString, key : secretKey, pageSize : pageSize]
    }
    
    func getSimpleProducts(searchString: String, pageSize: String, completion: @escaping (Result<ProductSimpleContainer>) -> Void) {
        Alamofire.request(baseUrl + search, parameters: setSearchParameters(searchString: searchString, pageSize: pageSize)).validate().responseJSON { response in
            switch response.result {
        
            case .success:
                if let json = response.result.value as? [String: Any] {
                    let productSimpleContainer = ProductSimpleContainer(json: json)
                    return completion(.success(productSimpleContainer))
                }
                return completion(.failure(NetworkError.unknown))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
        
    }
    
    func getImage(path: String?, imageView: UIImageView) {
        guard let path = path else { return }
        let url = URL(string: header + path)!
        
        imageView.af_setImage(withURL: url)
    }

}
