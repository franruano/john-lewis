//
//  ViewController.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import UIKit

class ProductGridViewController: UIViewController {

    var network: NetworkProtocol? {
        didSet {
            network?.getSimpleProducts(completion: {[weak self] (result: Result<ProductSimpleContainer>?) in
                switch result {
                case .success(let products)?:
                    self?.productContainer = products
                case .failure(_)?:
                    break
                default:
                    break
                }

            })
        }
    }
    var productContainer: ProductSimpleContainer? {
        didSet {
            self.title = "dishwasher(\(productContainer?.results))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }



}

