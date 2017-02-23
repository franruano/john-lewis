//
//  ProductCellTests.swift
//  JohnLewis
//
//  Created by Fran Abucillo on 23/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import XCTest
@testable import JohnLewis

class ProductCellTests: XCTestCase {
    
    var jsonContent: [String: Any]?
    
    override func setUp() {
        super.setUp()
        
        do {
            let bundle = Bundle(for: type(of: self))
            if let file = bundle.url(forResource: "ProductSimple", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    jsonContent = object
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
         jsonContent = nil
        
        super.tearDown()
    }
    

    
}
