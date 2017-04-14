//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//
import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

protocol CustomStringConvertible {
    var description : String { get }
}

protocol Mathematics {
    func add(to: Money) -> Money
    func subtract(from : Money) -> Money
}

////////////////////////////////////
// Money
//
public struct Money : CustomStringConvertible, Mathematics {
    public var amount : Double
    public var currency : String
    public var description : String {
        return "\(currency)\(amount)"
    }
    
    init (amount: Double, currency: String) {
        self.currency = currency
        self.amount = amount
    }
    
    let rates = ["USD": 1, "GBP": 0.5, "EUR": 1.5, "CAN": 1.25]
    
    public func convert(_ to: String) -> Money {
        let rate = rates[to]! / rates[self.currency]!
        return Money(amount: rate * self.amount , currency: to)
    }
    
    public func add(to: Money) -> Money {
        return Money(amount: self.convert(to.currency).amount + to.amount, currency: to.currency)
    }
    public func subtract(from: Money) -> Money {
        return Money(amount: from.amount - self.convert(from.currency).amount , currency: from.currency)
    }
}

extension Double {
    var USD : Money {
        return Money(amount: self, currency: "USD")
    }
    var GBP : Money {
        return Money(amount: self, currency: "GBP")
    }
    var EUR : Money {
        return Money(amount: self, currency: "EUR")
    }
    var CAN : Money {
        return Money(amount: self, currency: "CAN")
    }
}

////////////////////////////////////
// Job
//
open class Job : CustomStringConvertible {
    fileprivate var title : String
    fileprivate var type : JobType
    public var description: String {
        switch type {
        case let .Hourly(rate):
            return "Title: \(title), salary: \(rate) per hour"
        case let .Salary(annual):
            return "Title: \(title), salary: \(annual) per year"
        }
    }
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    open func calculateIncome(_ hours: Int) -> Int {
        switch type {
        case let .Hourly(rate):
            return Int(Double(hours) * rate)
        case let .Salary(annual):
            return annual
        }
    }
    
    open func raise(_ amt : Double) {
        switch type {
        case let .Hourly(rate): self.type = .Hourly(amt + rate)
        case let .Salary(annual): self.type = .Salary(Int(amt) + annual)
        }
    }
}

////////////////////////////////////
// Person
//
open class Person : CustomStringConvertible {
    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0
    public var description: String {
        var str = "firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age)"
            
        if let job = self.job?.title {
            str += (" job:\(job)")
        } else {
            str += (" job:nil")
        }
            
        if let spouse = spouse {
            str += (" spouse:\(spouse.firstName) \(spouse.lastName)")
        } else {
            str += (" spouse:nil")
        }
        return str
    }
    
    
    fileprivate var _job : Job? = nil
    open var job : Job? {
        get {
            return _job
        }
        set(value) {
            if age > 16 {
                _job = value
            }
        }
    }
    
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get {
            return _spouse
        }
        set(value) {
            if age > 18 {
                _spouse = value
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        _job = nil
        _spouse = nil
    }
    
    open func toString() -> String {
        return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(String(describing: _job)) spouse:\(String(describing: _spouse))]"
    }
}

////////////////////////////////////
// Family
//
open class Family : CustomStringConvertible {
    fileprivate var members : [Person] = []
    public var description: String {
        var str = "Members of family:"
        for member in members {
            str += " " + member.firstName
        }
        return str
    }
    
    public init(spouse1: Person, spouse2: Person) {
        if spouse1.spouse == nil && spouse2.spouse == nil {
            spouse1.spouse = spouse2
            spouse2.spouse = spouse1
            members.append(spouse1)
            members.append(spouse2)
        }
    }
    
    open func haveChild(_ child: Person) -> Bool {
        var legal = false
        for member in members {
            if member.age >= 21 {
                legal = true
            }
        }
        if legal {
            members.append(child)
        }
        return true
    }
    
    open func householdIncome() -> Int {
        var total : Int = 0
        for member in members {
            if member.job != nil {
                total += (member.job?.calculateIncome(2000))!
            }
        }
        return total
    }
}




