//
//  ProductGridDataSource.swift
//  JohnLewis
//
//  Created by Fran Ruano on 23/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import Foundation

class ProductGridDataSource {
    var products: [ProductSimple]?
    
    init(products: [ProductSimple]? = [ProductSimple]()) {
        self.products = products
    }
}
