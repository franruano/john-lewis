//
//  ProductGridDataSource.swift
//  JohnLewis
//
//  Created by Fran Ruano on 23/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import UIKit

class ProductGridDataSource: NSObject {
    
    let reuseIdentifier = "ProductCell"
    var products: [ProductSimple]?
    
    init(products: [ProductSimple]? = [ProductSimple]()) {
        self.products = products
    }
    
    
    //Network
    
    //Keys hardcoded
    //Url elements
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProductCell else {
            fatalError("Cell \(reuseIdentifier) couln't be dequeue")
        }
        cell.setData(product: products?[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout

extension ProductGridDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        return CGSize(width: (screenWidth/3) - 10, height: screenWidth/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}

