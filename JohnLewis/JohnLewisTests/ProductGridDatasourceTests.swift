//
//  ProductGridDatasourceTests.swift
//  JohnLewis
//
//  Created by Fran Ruano on 23/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import XCTest
@testable import JohnLewis

class ProductGridDatasourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProductGridDatasourceInitWithDefault() {
        let productGridDataSource = ProductGridDataSource()
        XCTAssertNotNil(productGridDataSource.products, "Product should NOT be nil")
        XCTAssertEqual(productGridDataSource.products?.count, 0, "Wrong product size")
        
    }
    
}
