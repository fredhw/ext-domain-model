//
//  ExtensionTest.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/13/17.
//  Copyright © 2017 fredhw. All rights reserved.
//

import XCTest

class ExtensionTest: XCTestCase {
    func testUSD() {
        let tenUSD = 10.USD
        XCTAssert(tenUSD.amount == 10.0)
        XCTAssert(tenUSD.currency == "USD")
    }
    func testCAN() {
        let tenCAN = 10.CAN
        XCTAssert(tenCAN.amount == 10.0)
        XCTAssert(tenCAN.currency == "CAN")
    }
    
    func testEUR() {
        let twoEUR = 2.0.EUR
        XCTAssert(twoEUR.amount == 2.0)
        XCTAssert(twoEUR.currency == "EUR")
    }
    
    func testGBP() {
        let fiveGBP = 10.USD.convert("GBP")
        XCTAssert(fiveGBP.amount == 5.0)
        XCTAssert(fiveGBP.currency == "GBP")
        
    }
}
