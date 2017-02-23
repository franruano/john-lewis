
//
//  NetworkProtocol.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func getSimpleProducts(completion: (Result<ProductSimpleContainer>) -> Void)
}
