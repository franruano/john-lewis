
//
//  NetworkProtocol.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import UIKit

protocol NetworkProtocol {
    func getSimpleProducts(searchString: String, pageSize: String, completion: @escaping (Result<ProductSimpleContainer>) -> Void)
    
     func getImage(path: String?, imageView: UIImageView)
}
