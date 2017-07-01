//
//  RawBytes.Tests.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 30/06/17.
//
//

import XCTest
@testable import BRUtils

extension BRUtilsTests {
    
    func testRawBytes_UInt8() {
        
        let i = UInt8(0xAB)
        var arr = i.rawBytes

        XCTAssertEqual(arr.count, 1)

        let t = UInt8(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_Int8() {
        
        let i = Int8(0x65)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 1)
        
        let t = Int8(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_UInt16() {
        
        let i = UInt16(0xABCD)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 2)
        
        let t = UInt16(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_Int16() {
        
        let i = Int16(0x6543)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 2)
        
        let t = Int16(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_UInt32() {
        
        let i = UInt32(0xABCDEF01)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 4)
        
        let t = UInt32(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_Int32() {
        
        let i = Int32(0x6543210F)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 4)
        
        let t = Int32(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_UInt64() {
        
        let i = UInt64(0x5BCDEF0123456789) * 2
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 8)
        
        let t = UInt64(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_Int64() {
        
        let i = Int64(0x6543210FEDCBA987)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 8)
        
        let t = Int64(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_Float() {
        
        let i = Float(1.2345e-4)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 4)
        
        let t = Float(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    
    func testRawBytes_Double() {
        
        let i = Double(1.2345e-4)
        var arr = i.rawBytes
        
        XCTAssertEqual(arr.count, 8)
        
        let t = Double(rawBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_String() {
        
        let str = "Some string"
        var arr = str.rawBytes
        
        XCTAssertEqual(arr.count, 11)
        
        let t = String(rawBytes: &arr)
        
        XCTAssertEqual(str, t)
    }
    
    func testRawBytes_Data() {
        
        var data = Data()
        
        let i8: Int8 = 0x45
        let ui8: UInt8 = 0xAB
        let i16: Int16 = 0x1234
        let ui16: UInt16 = 0xB23F
        let i32: Int32 = 0x21436587
        let ui32: UInt32 = 0xD1F3E4A7
        let i64: Int64 = 0x1122334455667788
        let ui64: UInt64 = UInt64(0x51B2C3D4E5F69004) * 2
        let f: Float = 12.34
        let d: Double = -5.33e-22
        let str = "Some string"
        
        XCTAssertEqual(data.count, 0)

        data.append(i8)
        
        XCTAssertEqual(data.count, 1)
        
        data.append(ui8)
        
        XCTAssertEqual(data.count, 2)
        
        data.append(i16)
        
        XCTAssertEqual(data.count, 4)
        
        data.append(ui16)
        
        XCTAssertEqual(data.count, 6)
        
        data.append(i32)
        
        XCTAssertEqual(data.count, 10)
        
        data.append(ui32)
        
        XCTAssertEqual(data.count, 14)
        
        data.append(i64)
        
        XCTAssertEqual(data.count, 22)
        
        data.append(ui64)
        
        XCTAssertEqual(data.count, 30)
        
        data.append(f)
        
        XCTAssertEqual(data.count, 34)
        
        data.append(d)
        
        XCTAssertEqual(data.count, 42)
        
        data.append(str)
        
        XCTAssertEqual(data.count, 53)
        
        data.append(UInt8(0)) // End of CString
        
        XCTAssertEqual(data.count, 54)
        
        
        if let t8 = data.removeFirstInt8() {
            XCTAssertEqual(t8, i8)
        } else {
            XCTFail()
        }
        
        if let ut8 = data.removeFirstUInt8() {
            XCTAssertEqual(ut8, ui8)
        } else {
            XCTFail()
        }
        
        if let t16 = data.removeFirstInt16() {
            XCTAssertEqual(t16, i16)
        } else {
            XCTFail()
        }
        
        if let ut16 = data.removeFirstUInt16() {
            XCTAssertEqual(ut16, ui16)
        } else {
            XCTFail()
        }
        
        if let t32 = data.removeFirstInt32() {
            XCTAssertEqual(t32, i32)
        } else {
            XCTFail()
        }
        
        if let ut32 = data.removeFirstUInt32() {
            XCTAssertEqual(ut32, ui32)
        } else {
            XCTFail()
        }

        if let t64 = data.removeFirstInt64() {
            XCTAssertEqual(t64, i64)
        } else {
            XCTFail()
        }
        
        if let ut64 = data.removeFirstUInt64() {
            XCTAssertEqual(ut64, ui64)
        } else {
            XCTFail()
        }
        
        if let tf = data.removeFirstFloat() {
            XCTAssertEqual(tf, f)
        } else {
            XCTFail()
        }

        if let td = data.removeFirstDouble() {
            XCTAssertEqual(td, d)
        } else {
            XCTFail()
        }

        if let ts = data.removeFirstUtf8CString() {
            XCTAssertEqual(ts, str)
        } else {
            XCTFail()
        }
        
        XCTAssertEqual(data.count, 0)
    }
}
