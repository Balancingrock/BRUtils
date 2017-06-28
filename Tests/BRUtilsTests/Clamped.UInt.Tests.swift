//
//  Clamped.UInt.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_UInt() {
        
        var a: Int = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = Int.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = Int.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedInt8_UInt() {
        
        var a: Int8 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = Int8.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = Int8.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedInt16_UInt() {
        
        var a: Int16 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = Int16.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = Int16.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedInt32_UInt() {
        
        var a: Int32 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = Int32.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = Int32.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedInt64_UInt() {
        
        var a: Int64 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = Int64.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = Int64.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedUInt_UInt() {
        
        var a: UInt = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt.max)
        
        a = UInt.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedUInt8_UInt() {
        
        var a: UInt8 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt8.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = UInt8.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedUInt16_UInt() {
        
        var a: UInt16 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt16.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = UInt16.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedUInt32_UInt() {
        
        var a: UInt32 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt32.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt(a))
        
        a = UInt32.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedUInt64_UInt() {
        
        var a: UInt64 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt64.max
        b = UInt.clamped(a)
        XCTAssert(b == UInt.max)
        
        a = UInt64.min
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    
    func testClampedFloat_UInt() {
        
        var a: Float = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt.clamped(a)
        XCTAssert(b == UInt.max)
        
        a = -1e20
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedDouble_UInt() {
        
        var a: Double = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt.clamped(a)
        XCTAssert(b == UInt.max)
        
        a = -1e20
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    func testClampedFloat80_UInt() {
        
        var a: Float80 = 5
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt.clamped(a)
        XCTAssert(b == UInt.max)
        
        a = -1e20
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_UInt() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = UInt.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 1e20)
        b = UInt.clamped(a)
        XCTAssert(b == UInt.max)
        
        a = NSNumber(value: -1e20)
        b = UInt.clamped(a)
        XCTAssert(b == UInt.min)
    }
    
    #endif
}
