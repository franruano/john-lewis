//
//  ProductGridViewControllerTests.swift
//  JohnLewis
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import XCTest
@testable import JohnLewis

class ProductGridViewControllerTests: XCTestCase {
    var vc: ProductGridViewController?
    var network: NetworkProtocol?
    
    override func setUp() {
        super.setUp()
        
        vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductGridViewController") as? ProductGridViewController
        network = NetworkMock()
    }
    
    override func tearDown() {
        vc = nil
        network = nil
        
        super.tearDown()
    }
    
    func testProductGridInit() {
        XCTAssertNotNil(vc, "ProductGridViewController is nil")
        XCTAssertNil(vc?.network, "ProductGridViewController.network should be nil")
        XCTAssertNil(vc?.productContainer, "ProductGridViewController.network should be nil")
        vc?.network = network
        XCTAssertNotNil(vc?.network, "ProductGridViewController.network should NOT be nil")
        XCTAssertNotNil(vc?.productContainer, "ProductGridViewController.network should NOT be nil")
    }

    
}
