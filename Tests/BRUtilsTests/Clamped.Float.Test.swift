//
//  Clamped.Float.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedDouble_Float() {
        
        var a: Double = 5
        var b = Float.clamped(a)
        XCTAssert(b == 5)
        
        a = Double(2 * Float.greatestFiniteMagnitude)
        b = Float.clamped(a)
        XCTAssert(b == Float.greatestFiniteMagnitude)
        
        a = Double(-2 * Float.greatestFiniteMagnitude)
        b = Float.clamped(a)
        XCTAssert(b == -Float.greatestFiniteMagnitude)
    }
    
    func testClampedFloat80_Float() {
        
        var a: Float80 = 5
        var b = Float.clamped(a)
        XCTAssert(b == 5)
        
        a = Float80(2 * Float.greatestFiniteMagnitude)
        b = Float.clamped(a)
        XCTAssert(b == Float.greatestFiniteMagnitude)
        
        a = Float80(-2 * Float.greatestFiniteMagnitude)
        b = Float.clamped(a)
        XCTAssert(b == -Float.greatestFiniteMagnitude)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_Float() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = Float.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 2 * Float.greatestFiniteMagnitude)
        b = Float.clamped(a)
        XCTAssert(b == Float.greatestFiniteMagnitude)
        
        a = NSNumber(value: -2 * Float.greatestFiniteMagnitude)
        b = Float.clamped(a)
        XCTAssert(b == -Float.greatestFiniteMagnitude)
    }
    
    #endif
}
