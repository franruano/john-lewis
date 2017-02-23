//
//  ProductSimpleContainer.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import Foundation

struct ProductSimpleContainer {
    let products: [ProductSimple]
    let pageAvailable: Int
    let results: Int
    
    init(json: [String: Any]) {
        
        pageAvailable = json["pagesAvailable"] as? Int ?? 0
        results = json["results"] as? Int ?? 0
        var products = [ProductSimple]()
        if let productJson = json["products"] as? [[String: Any]] {
            let _ = productJson.map({
                let product = ProductSimple(json: $0)
                products.append(product)
            })
        }
        self.products = products
    }
}
