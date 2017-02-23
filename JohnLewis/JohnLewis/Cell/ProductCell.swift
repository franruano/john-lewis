//
//  ProductCell.swift
//  JohnLewis
//
//  Created by Fran Abucillo on 23/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var network: NetworkProtocol?
    
    func setData(product: ProductSimple?) {
        lblTitle.text = product?.title ?? ""
        
        network?.getImage(path: product?.imgUrlString, imageView: imgProduct)
    }
}
