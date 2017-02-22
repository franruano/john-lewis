//
//  ProductSimple.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import Foundation

struct ProductSimple {
    let productId: String
    let currentPrice: String
    let title: String
    let imgUrlString: String
    
    init(json: [String: Any]) {
        productId = json["productId"] as? String ?? ""
        currentPrice = (json["price"] as? [String: Any])?["now"] as? String ?? ""
        title = json["title"] as? String ?? ""
        imgUrlString = json["image"] as? String ?? ""
    }
    
}
