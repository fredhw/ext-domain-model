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
        let usd = 10.USD
        XCTAssert(usd.amount == 10.0)
        XCTAssert(usd.currency == "USD")
    }
    func testCAN() {
        let can = 5.CAN
        XCTAssert(can.amount == 5.0)
        XCTAssert(can.currency == "CAN")
    }
    
    func testEUR() {
        let eur = 2.0.EUR
        XCTAssert(eur.amount == 2)
        XCTAssert(eur.currency == "EUR")
    }
    
    func testGBP() {
        let gbp = 10.USD.convert("GBP")
        XCTAssert(gbp.amount == 5.0)
        XCTAssert(gbp.currency == "GBP")
        
    }
}
