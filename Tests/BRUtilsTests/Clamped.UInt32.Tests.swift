//
//  Clamped.UInt32.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_UInt32() {
        
        var a: Int = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = Int.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = Int.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedInt8_UInt32() {
        
        var a: Int8 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = Int8.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32(a))
        
        a = Int8.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedInt16_UInt32() {
        
        var a: Int16 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = Int16.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32(a))
        
        a = Int16.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedInt32_UInt32() {
        
        var a: Int32 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = Int32.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32(a))
        
        a = Int32.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedInt64_UInt32() {
        
        var a: Int64 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = Int64.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = Int64.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedUInt_UInt32() {
        
        var a: UInt = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = UInt.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedUInt8_UInt32() {
        
        var a: UInt8 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt8.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32(a))
        
        a = UInt8.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedUInt16_UInt32() {
        
        var a: UInt16 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt16.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32(a))
        
        a = UInt16.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedUInt32_UInt32() {
        
        var a: UInt32 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt32.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = UInt32.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedUInt64_UInt32() {
        
        var a: UInt64 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt64.max
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = UInt64.min
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    
    func testClampedFloat_UInt32() {
        
        var a: Float = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = -1e20
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedDouble_UInt32() {
        
        var a: Double = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = -1e20
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    func testClampedFloat80_UInt32() {
        
        var a: Float80 = 5
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = -1e20
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_UInt32() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = UInt32.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 1e20)
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.max)
        
        a = NSNumber(value: -1e20)
        b = UInt32.clamped(a)
        XCTAssert(b == UInt32.min)
    }
    
    #endif
}
