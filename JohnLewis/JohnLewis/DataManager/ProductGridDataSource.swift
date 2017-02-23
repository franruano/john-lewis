//
//  ProductGridDataSource.swift
//  JohnLewis
//
//  Created by Fran Ruano on 23/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import UIKit

class ProductGridDataSource: NSObject {
    
    let reuseIdentifier = "cell"
    var products: [ProductSimple]?
    
    init(products: [ProductSimple]? = [ProductSimple]()) {
        self.products = products
    }
    
    
    //Pasar a la UI
    //Network
    //Cell builder
    
    //Keys hardcoded
    //Url elements
    //Cell layout?
}

extension ProductGridDataSource: UICollectionViewDataSource {
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        cell.backgroundColor = .red

//            return cell
        return UICollectionViewCell()
    }
}
