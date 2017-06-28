//
//  Clamped.Int.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 28/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testClampedInt_Int() {
        
        var a: Int = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = Int.max
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = Int.min
        b = Int.clamped(a)
        XCTAssert(b == Int.min)
    }
    
    func testClampedInt8_Int() {
        
        var a: Int8 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = Int8.max
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
        
        a = Int8.min
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
    }
    
    func testClampedInt16_Int() {
        
        var a: Int16 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = Int16.max
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
        
        a = Int16.min
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
    }
    
    func testClampedInt32_Int() {
        
        var a: Int32 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = Int32.max
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
        
        a = Int32.min
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
    }
    
    func testClampedInt64_Int() {
        
        var a: Int64 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = Int64.max
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = Int64.min
        b = Int.clamped(a)
        XCTAssert(b == Int.min)
    }
    
    func testClampedUInt_Int() {
        
        var a: UInt = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt.max
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = UInt.min
        b = Int.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt8_Int() {
        
        var a: UInt8 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt8.max
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
        
        a = UInt8.min
        b = Int.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt16_Int() {
        
        var a: UInt16 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt16.max
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
        
        a = UInt16.min
        b = Int.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt32_Int() {
        
        var a: UInt32 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt32.max
        b = Int.clamped(a)
        XCTAssert(b == Int(a))
        
        a = UInt32.min
        b = Int.clamped(a)
        XCTAssert(b == 0)
    }
    
    func testClampedUInt64_Int() {
        
        var a: UInt64 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = UInt64.max
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = UInt64.min
        b = Int.clamped(a)
        XCTAssert(b == 0)
    }
    
    
    func testClampedFloat_Int() {
        
        var a: Float = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = -1e20
        b = Int.clamped(a)
        XCTAssert(b == Int.min)
    }
    
    func testClampedDouble_Int() {
        
        var a: Double = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = -1e20
        b = Int.clamped(a)
        XCTAssert(b == Int.min)
    }
    
    func testClampedFloat80_Int() {
        
        var a: Float80 = 5
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = 1e20
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = -1e20
        b = Int.clamped(a)
        XCTAssert(b == Int.min)
    }
    
    #if os(OSX)
    
    func testClampedNSNumber_Int() {
        
        var a: NSNumber = NSNumber(value: 5)
        var b = Int.clamped(a)
        XCTAssert(b == 5)
        
        a = NSNumber(value: 1e20)
        b = Int.clamped(a)
        XCTAssert(b == Int.max)
        
        a = NSNumber(value: -1e20)
        b = Int.clamped(a)
        XCTAssert(b == Int.min)
    }
    
    #endif
}
