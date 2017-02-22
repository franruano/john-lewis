//
//  JohnLewisTests.swift
//  JohnLewisTests
//
//  Created by Fran Ruano on 22/2/17.
//  Copyright © 2017 Fran Ruano. All rights reserved.
//

import XCTest
@testable import JohnLewis

class ProductSimpleTests: XCTestCase {
    
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
    
    func testInitProductSimple() {
        guard let products = jsonContent?["products"] as? [Any],
        let jsonProduct = products[0] as? [String: Any] else {
            XCTFail("Wrong products structure")
            return
        }
        let firstProduct = ProductSimple(json: jsonProduct)
        XCTAssertEqual(firstProduct.productId, "1913470", "ProductId is wrong")
        XCTAssertEqual(firstProduct.title, "Bosch SMV53M40GB Fully Integrated Dishwasher", "Title is wrong")
        XCTAssertEqual(firstProduct.currentPrice, "499.00", "Price is wrong")
        XCTAssertEqual(firstProduct.imgUrlString, "//johnlewis.scene7.com/is/image/JohnLewis/234326372?", "imgUrl is wrong")
    }
    

}
