//
//  Clamped.UInt8.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_UInt8() {
        
        var a: Int = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedInt8_UInt8() {
        
        var a: Int8 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = -5
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedInt16_UInt8() {
        
        var a: Int16 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedInt32_UInt8() {
        
        var a: Int32 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedInt64_UInt8() {
        
        var a: Int64 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedUInt_UInt8() {
        
        var a: UInt = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = 0
        b = UInt8.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt8_UInt8() {
        
        let a: UInt8 = 5
        let b = UInt8.clamped(a)
        XCTAssert(b == 5)
    }
    
    func testClampedUInt16_UInt8() {
        
        var a: UInt16 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = 0
        b = UInt8.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt32_UInt8() {
        
        var a: UInt32 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = 0
        b = UInt8.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt64_UInt8() {
        
        var a: UInt64 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = 0
        b = UInt8.clamped(a)
        XCTAssert(b == 0)
    }
    
    
    func testClampedFloat_UInt8() {
        
        var a: Float = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedDouble_UInt8() {
        
        var a: Double = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    func testClampedFloat80_UInt8() {
        
        var a: Float80 = 5
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = 1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = -1000
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_UInt8() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = UInt8.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 1000)
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.max)
        
        a = NSNumber(value: -1000)
        b = UInt8.clamped(a)
        XCTAssert(b == UInt8.min)
    }
    
    #endif
}
