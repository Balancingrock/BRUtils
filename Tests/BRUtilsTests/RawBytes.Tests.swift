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
    
    func testRawBytes_LittleUInt8() {
        
        let i = UInt8(0xAB)
        var arr = i.littleBytes

        XCTAssertEqual(arr.count, 1)

        let t = UInt8(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigUInt8() {
        
        let i = UInt8(0xAB)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 1)
        
        let t = UInt8(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_LittleInt8() {
        
        let i = Int8(0x65)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 1)
        
        let t = Int8(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_BigInt8() {
        
        let i = Int8(0x65)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 1)
        
        let t = Int8(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_LittleUInt16() {
        
        let i = UInt16(0xABCD)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 2)
        XCTAssertEqual(arr, [0xCD, 0xAB])
        
        let t = UInt16(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigUInt16() {
        
        let i = UInt16(0xABCD)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 2)
        XCTAssertEqual(arr, [0xAB, 0xCD])
        
        let t = UInt16(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_LittleInt16() {
        
        let i = Int16(0x6543)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 2)
        XCTAssertEqual(arr, [0x43, 0x65])

        let t = Int16(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigInt16() {
        
        let i = Int16(0x6543)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 2)
        XCTAssertEqual(arr, [0x65, 0x43])

        let t = Int16(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_LittleUInt32() {
        
        let i = UInt32(0xABCDEF01)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 4)
        XCTAssertEqual(arr, [0x01, 0xEF, 0xCD, 0xAB])
        
        let t = UInt32(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigUInt32() {
        
        let i = UInt32(0xABCDEF01)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 4)
        XCTAssertEqual(arr, [0xAB, 0xCD, 0xEF, 0x01])

        let t = UInt32(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_LittleInt32() {
        
        let i = Int32(0x6543210F)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 4)
        XCTAssertEqual(arr, [0x0F, 0x21, 0x43, 0x65])

        let t = Int32(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigInt32() {
        
        let i = Int32(0x6543210F)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 4)
        XCTAssertEqual(arr, [0x65, 0x43, 0x21, 0x0F])

        let t = Int32(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_LittleUInt64() {
        
        let i = UInt64(0x5BCDEF0123456789) * 2
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 8)
        XCTAssertEqual(arr, [18, 207, 138, 70, 2, 222, 155, 183])
        
        let t = UInt64(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigUInt64() {
        
        let i = UInt64(0x5BCDEF0123456789) * 2
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 8)
        XCTAssertEqual(arr, [183, 155, 222, 2, 70, 138, 207, 18])
        
        let t = UInt64(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_LittleInt64() {
        
        let i = Int64(0x6543210FEDCBA987)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 8)
        XCTAssertEqual(arr, [0x87, 0xA9, 0xCB, 0xED, 0x0F, 0x21, 0x43, 0x65])

        let t = Int64(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigInt64() {
        
        let i = Int64(0x6543210FEDCBA987)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 8)
        XCTAssertEqual(arr, [0x65, 0x43, 0x21, 0x0F, 0xED, 0xCB, 0xA9, 0x87])

        let t = Int64(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_LittleFloat() {
        
        let i = Float(1.2345e-4)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 4)
        
        let t = Float(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigFloat() {
        
        let i = Float(1.2345e-4)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 4)
        
        let t = Float(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    
    func testRawBytes_LittleDouble() {
        
        let i = Double(1.2345e-4)
        var arr = i.littleBytes
        
        XCTAssertEqual(arr.count, 8)
        
        let t = Double(littleBytes: &arr)
        
        XCTAssertEqual(i, t)
    }

    func testRawBytes_BigDouble() {
        
        let i = Double(1.2345e-4)
        var arr = i.bigBytes
        
        XCTAssertEqual(arr.count, 8)
        
        let t = Double(bigBytes: &arr)
        
        XCTAssertEqual(i, t)
    }
    
    func testRawBytes_LittleString() {
        
        let str = "Some string"
        var arr = str.littleBytes
        
        XCTAssertEqual(arr.count, 11)
        
        let t = String(littleBytes: &arr)
        
        XCTAssertEqual(str, t)
    }
    
    func testRawBytes_BigString() {
        
        let str = "Some string"
        var arr = str.bigBytes
        
        XCTAssertEqual(arr.count, 11)
        
        let t = String(bigBytes: &arr)
        
        XCTAssertEqual(str, t)
    }

    func testRawBytes_LittleData() {
        
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

        data.appendLittle(i8)
        
        XCTAssertEqual(data.count, 1)
        
        data.appendLittle(ui8)
        
        XCTAssertEqual(data.count, 2)
        
        data.appendLittle(i16)
        
        XCTAssertEqual(data.count, 4)
        
        data.appendLittle(ui16)
        
        XCTAssertEqual(data.count, 6)
        
        data.appendLittle(i32)
        
        XCTAssertEqual(data.count, 10)
        
        data.appendLittle(ui32)
        
        XCTAssertEqual(data.count, 14)
        
        data.appendLittle(i64)
        
        XCTAssertEqual(data.count, 22)
        
        data.appendLittle(ui64)
        
        XCTAssertEqual(data.count, 30)
        
        data.appendLittle(f)
        
        XCTAssertEqual(data.count, 34)
        
        data.appendLittle(d)
        
        XCTAssertEqual(data.count, 42)
        
        data.appendLittle(str)
        
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
        
        if let t16 = data.removeFirstLittleInt16() {
            XCTAssertEqual(t16, i16)
        } else {
            XCTFail()
        }
        
        if let ut16 = data.removeFirstLittleUInt16() {
            XCTAssertEqual(ut16, ui16)
        } else {
            XCTFail()
        }
        
        if let t32 = data.removeFirstLittleInt32() {
            XCTAssertEqual(t32, i32)
        } else {
            XCTFail()
        }
        
        if let ut32 = data.removeFirstLittleUInt32() {
            XCTAssertEqual(ut32, ui32)
        } else {
            XCTFail()
        }

        if let t64 = data.removeFirstLittleInt64() {
            XCTAssertEqual(t64, i64)
        } else {
            XCTFail()
        }
        
        if let ut64 = data.removeFirstLittleUInt64() {
            XCTAssertEqual(ut64, ui64)
        } else {
            XCTFail()
        }
        
        if let tf = data.removeFirstLittleFloat() {
            XCTAssertEqual(tf, f)
        } else {
            XCTFail()
        }

        if let td = data.removeFirstLittleDouble() {
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
    
    func testRawBytes_BigData() {
        
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
        
        data.appendBig(i8)
        
        XCTAssertEqual(data.count, 1)
        
        data.appendBig(ui8)
        
        XCTAssertEqual(data.count, 2)
        
        data.appendBig(i16)
        
        XCTAssertEqual(data.count, 4)
        
        data.appendBig(ui16)
        
        XCTAssertEqual(data.count, 6)
        
        data.appendBig(i32)
        
        XCTAssertEqual(data.count, 10)
        
        data.appendBig(ui32)
        
        XCTAssertEqual(data.count, 14)
        
        data.appendBig(i64)
        
        XCTAssertEqual(data.count, 22)
        
        data.appendBig(ui64)
        
        XCTAssertEqual(data.count, 30)
        
        data.appendBig(f)
        
        XCTAssertEqual(data.count, 34)
        
        data.appendBig(d)
        
        XCTAssertEqual(data.count, 42)
        
        data.appendBig(str)
        
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
        
        if let t16 = data.removeFirstBigInt16() {
            XCTAssertEqual(t16, i16)
        } else {
            XCTFail()
        }
        
        if let ut16 = data.removeFirstBigUInt16() {
            XCTAssertEqual(ut16, ui16)
        } else {
            XCTFail()
        }
        
        if let t32 = data.removeFirstBigInt32() {
            XCTAssertEqual(t32, i32)
        } else {
            XCTFail()
        }
        
        if let ut32 = data.removeFirstBigUInt32() {
            XCTAssertEqual(ut32, ui32)
        } else {
            XCTFail()
        }
        
        if let t64 = data.removeFirstBigInt64() {
            XCTAssertEqual(t64, i64)
        } else {
            XCTFail()
        }
        
        if let ut64 = data.removeFirstBigUInt64() {
            XCTAssertEqual(ut64, ui64)
        } else {
            XCTFail()
        }
        
        if let tf = data.removeFirstBigFloat() {
            XCTAssertEqual(tf, f)
        } else {
            XCTFail()
        }
        
        if let td = data.removeFirstBigDouble() {
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
