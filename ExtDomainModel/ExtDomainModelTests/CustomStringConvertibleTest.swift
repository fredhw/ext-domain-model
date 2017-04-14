//
//  CustomStringConvertibleTest.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/13/17.
//  Copyright © 2017 fredhw. All rights reserved.
//

import XCTest

class CustomStringConvertibleTest: XCTestCase {

    func testMoney() {
        let tenUSD = 10.0.USD
        XCTAssert(tenUSD.description == "USD10.0")
    }
    
    func testJob() {
        let professor = Job(title: "Professor", type: Job.JobType.Salary(72470))
        let student = Job(title: "TA",type: Job.JobType.Hourly(15.0))
        XCTAssert(professor.description == "Title: Professor, salary: 72470 per year")
        XCTAssert(student.description == "Title: TA, salary: 15.0 per hour")
    }
    
    func testPerson() {
        let husband = Person(firstName: "Adam", lastName: "Apple", age: 30)
        let wife = Person(firstName: "Eve", lastName: "Apple", age: 26)
        let _ = Family(spouse1: husband, spouse2: wife)
        print(husband.description)
        XCTAssert(husband.description == "firstName:Adam lastName:Apple age:30 job:nil spouse:Eve Apple")
    }
    
    func testFamily() {
        let husband = Person(firstName: "Adam", lastName: "Apple", age: 30)
        let wife = Person(firstName: "Eve", lastName: "Apple", age: 26)
        let family = Family(spouse1: husband, spouse2: wife)
        let child = Person(firstName: "Pine", lastName: "Apple", age: 5)
        family.haveChild(child)
        XCTAssert(family.description == "Members of family: Adam Eve Pine")
    }
    
}
