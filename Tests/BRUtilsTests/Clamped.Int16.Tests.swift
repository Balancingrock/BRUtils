//
//  Clamped.Int16.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_Int16() {
        
        var a: Int = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = Int.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = Int.min
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    func testClampedInt8_Int16() {
        
        var a: Int8 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)

        a = Int8.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16(a))
        
        a = Int8.min
        b = Int16.clamped(a)
        XCTAssert(b == Int16(a))
    }
    
    func testClampedInt16_Int16() {
        
        var a: Int16 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = Int16.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = Int16.min
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    func testClampedInt32_Int16() {
        
        var a: Int32 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = Int32.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = Int32.min
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    func testClampedInt64_Int16() {
        
        var a: Int64 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = Int64.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = Int64.min
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    func testClampedUInt_Int16() {
        
        var a: UInt = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = UInt.min
        b = Int16.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt8_Int16() {
        
        var a: UInt8 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt8.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16(a))
        
        a = UInt8.min
        b = Int16.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt16_Int16() {
        
        var a: UInt16 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt16.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = UInt16.min
        b = Int16.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt32_Int16() {
        
        var a: UInt32 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt32.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = UInt32.min
        b = Int16.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt64_Int16() {
        
        var a: UInt64 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt64.max
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = UInt64.min
        b = Int16.clamped(a)
        XCTAssert(b == 0)
    }
    
    
    func testClampedFloat_Int16() {
        
        var a: Float = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = -1e20
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    func testClampedDouble_Int16() {
        
        var a: Double = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = -1e20
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    func testClampedFloat80_Int16() {
        
        var a: Float80 = 5
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = -1e20
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_Int16() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = Int16.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 1e20)
        b = Int16.clamped(a)
        XCTAssert(b == Int16.max)
        
        a = NSNumber(value: -1e20)
        b = Int16.clamped(a)
        XCTAssert(b == Int16.min)
    }
    
    #endif
}
