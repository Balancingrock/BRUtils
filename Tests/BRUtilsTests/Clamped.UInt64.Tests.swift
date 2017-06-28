//
//  Clamped.UInt64.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_UInt64() {
        
        var a: Int = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = Int.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = Int.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedInt8_UInt64() {
        
        var a: Int8 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = Int8.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = Int8.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedInt16_UInt64() {
        
        var a: Int16 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = Int16.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = Int16.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedInt32_UInt64() {
        
        var a: Int32 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = Int32.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = Int32.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedInt64_UInt64() {
        
        var a: Int64 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = Int64.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = Int64.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedUInt_UInt64() {
        
        var a: UInt = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.max)
        
        a = UInt.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedUInt8_UInt64() {
        
        var a: UInt8 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt8.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = UInt8.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedUInt16_UInt64() {
        
        var a: UInt16 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt16.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = UInt16.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedUInt32_UInt64() {
        
        var a: UInt32 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt32.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64(a))
        
        a = UInt32.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedUInt64_UInt64() {
        
        var a: UInt64 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt64.max
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.max)
        
        a = UInt64.min
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    
    func testClampedFloat_UInt64() {
        
        var a: Float = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.max)
        
        a = -1e20
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedDouble_UInt64() {
        
        var a: Double = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.max)
        
        a = -1e20
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    func testClampedFloat80_UInt64() {
        
        var a: Float80 = 5
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.max)
        
        a = -1e20
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_UInt64() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = UInt64.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 1e20)
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.max)
        
        a = NSNumber(value: -1e20)
        b = UInt64.clamped(a)
        XCTAssert(b == UInt64.min)
    }
    
    #endif
}
