//
//  MathematicsTest.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/13/17.
//  Copyright © 2017 fredhw. All rights reserved.
//

import XCTest

class MathematicsTest: XCTestCase {

    func testAdd() {
        let usd = 100.0.USD
        let protocolAdd = usd.add(to: usd)
        XCTAssert(protocolAdd.amount == 200.0)
    }
    
    func testSubtract() {
        let can = 100.CAN
        let usd = 10.0.USD
        let protocolSub = usd.subtract(from: can)
        XCTAssert(protocolSub.amount == 87.5)
    }

}
