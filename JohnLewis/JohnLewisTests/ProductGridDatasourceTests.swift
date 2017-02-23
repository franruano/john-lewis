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
    var productContainer: ProductSimpleContainer?
    let layout = UICollectionViewFlowLayout()
    
    
    override func setUp() {
        super.setUp()
        do {
            let bundle = Bundle(for: type(of: self))
            if let file = bundle.url(forResource: "ProductSimple", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    productContainer = ProductSimpleContainer(json: object)
                } else if let _ = json as? [Any] {
                    XCTFail("Wrong spected structure")
                } else {
                    XCTFail("Invalid JSON")
                }
            } else {
                XCTFail("No file")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
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
    
    func testProductGridDatasourceInit() {
        let productGridDataSource = ProductGridDataSource(products: productContainer?.products)
        XCTAssertNotNil(productGridDataSource.products, "Product should NOT be nil")
        XCTAssertEqual(productGridDataSource.products?.count, 20, "Wrong product size")
    }
    
    func testNumberOfSections() {
        let productGridDataSource = ProductGridDataSource(products: productContainer?.products)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let numberOfSections = productGridDataSource.numberOfSections(in: collectionView)
        XCTAssertEqual(numberOfSections, 1, "Number of sections is wrong")
    }
    
    func testNumberOfRowsOnFirstSection() {
        let productGridDataSource = ProductGridDataSource(products: productContainer?.products)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let numberOfRows = productGridDataSource.collectionView(collectionView, numberOfItemsInSection: 1)
        XCTAssertEqual(numberOfRows, productContainer?.products.count, "Number of rows is wrong")
    }

    
}
