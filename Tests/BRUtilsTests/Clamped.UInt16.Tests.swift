//
//  Clamped.UInt16.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_UInt16() {
        
        var a: Int = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = -100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedInt8_UInt16() {
        
        var a: Int8 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = -5
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedInt16_UInt16() {
        
        var a: Int16 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = -30000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedInt32_UInt16() {
        
        var a: Int32 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = -100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedInt64_UInt16() {
        
        var a: Int64 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = -100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedUInt_UInt16() {
        
        var a: UInt = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = 0
        b = UInt16.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt8_UInt16() {
        
        let a: UInt8 = 5
        let b = UInt16.clamped(a)
        XCTAssert(b == 5)
    }
    
    func testClampedUInt16_UInt16() {
        
        let a: UInt16 = 5
        let b = UInt16.clamped(a)
        XCTAssert(b == 5)
    }
    
    func testClampedUInt32_UInt16() {
        
        var a: UInt32 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = 0
        b = UInt16.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt64_UInt16() {
        
        var a: UInt64 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = 0
        b = UInt16.clamped(a)
        XCTAssert(b == 0)
    }
    
    
    func testClampedFloat_UInt16() {
        
        var a: Float = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = -100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedDouble_UInt16() {
        
        var a: Double = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = -100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    func testClampedFloat80_UInt16() {
        
        var a: Float80 = 5
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = 100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = -100000
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_UInt16() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = UInt16.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 100000)
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.max)
        
        a = NSNumber(value: -100000)
        b = UInt16.clamped(a)
        XCTAssert(b == UInt16.min)
    }
    
    #endif
}
