// =====================================================================================================================
//
//  File:       Extensions.swift
//  Project:    BRUtils
//
//  Version:    0.13.0
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Blog:       http://swiftrien.blogspot.com
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2014-2017 Marinus van der Lugt, All rights reserved.
//
//  License:    Use or redistribute this code any way you like with the following two provision:
//
//  1) You ACCEPT this source code AS IS without any guarantees that it will work as intended. Any liability from its
//  use is YOURS.
//
//  2) You WILL NOT seek damages from the author or balancingrock.nl.
//
//  I also ask you to please leave this header with the source code.
//
//  I strongly believe that voluntarism is the way for societies to function optimally. Thus I have choosen to leave it
//  up to you to determine the price for this code. You pay me whatever you think this code is worth to you.
//
//   - You can send payment via paypal to: sales@balancingrock.nl
//   - Or wire bitcoins to: 1GacSREBxPy1yskLMc9de2nofNv2SNdwqH
//
//  I prefer the above two, but if these options don't suit you, you can also send me a gift from my amazon.co.uk
//  wishlist: http://www.amazon.co.uk/gp/registry/wishlist/34GNMPZKAQ0OO/ref=cm_sw_em_r_wsl_cE3Tub013CKN6_wb
//
//  If you like to pay in another way, please contact me at rien@balancingrock.nl
//
//  (It is always a good idea to visit the website/blog/google to ensure that you actually pay me and not some imposter)
//
//  For private and non-profit use the suggested price is the price of 1 good cup of coffee, say $4.
//  For commercial use the suggested price is the price of 1 good meal, say $20.
//
//  You are however encouraged to pay more ;-)
//
//  Prices/Quotes for support, modifications or enhancements can be obtained from: rien@balancingrock.nl
//
// =====================================================================================================================
// PLEASE let me know about bugs, improvements and feature requests. (rien@balancingrock.nl)
// =====================================================================================================================
//
// History
//
// 0.13.0 - Removed warnings for Swift 5
// 0.9.0  - Added UnsafeRawPointer type extractions
//        - Added crc16 calculation to Data
// 0.6.0  - Added range and clamp as an Array extension.
// 0.4.0  - Added Int extensions for isEven, isUneven, isMultiple(of)
// 0.3.0  - Moved the comparable extension to global functions.
//        - Removed the dictionary and data extensions
//        - Added NSNumber extension
// 0.1.0  - Initial release, copied from SwiftfireCore in the version 0.9.17
// =====================================================================================================================


import Foundation


public extension Bool {
    
    
    /// Initializes a bool from '0', '1', 'yes', 'no', 'true' or 'false'. Case insensitive.
    
    init?(lettersOrDigits: String) {
        if lettersOrDigits == "0" { self = false }
        else if lettersOrDigits == "1" { self = true }
        else if lettersOrDigits.compare("true", options: [.diacriticInsensitive, .caseInsensitive], range: nil, locale: nil) == ComparisonResult.orderedSame { self = true }
        else if lettersOrDigits.compare("false", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else if lettersOrDigits.compare("yes", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = true }
        else if lettersOrDigits.compare("no", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else { return nil }
    }
    
    
    /// Initializes a bool from 'yes', 'no', 'true' or 'false'. Case insensitive.
    
    init?(letters: String) {
        if letters.compare("true", options: [.diacriticInsensitive, .caseInsensitive], range: nil, locale: nil) == ComparisonResult.orderedSame { self = true }
        else if letters.compare("false", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else if letters.compare("yes", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = true }
        else if letters.compare("no", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else { return nil }
    }
}


public extension Array {
    
    /// Removes the given object from the array.
    
    @discardableResult
    mutating func removeObject<T: AnyObject>(object: T) -> T? {
        for (i, obj) in self.enumerated() {
            if obj as? T === object {
                return self.remove(at: i) as? T
            }
        }
        return nil
    }
    
    
    /// - Returns: The range for this array
    
    var range: Range<Array.Index> {
        return Range.init(uncheckedBounds: (lower: self.startIndex, upper: self.endIndex))
    }
    
    
    /// - Returns: The given index clamped to either self.startIndex or self.endIndex.
    
    func clamp(_ index: Int) -> Int {
        if index < self.startIndex { return self.startIndex }
        if index > self.endIndex { return self.endIndex }
        return index
    }
}


public extension NSNumber {
    
    
    /// Returns a number, first tries to convert the string to a bool, then an Int and lastly a double.
    
    static func factory(boolIntDouble: String) -> NSNumber? {
        let str = boolIntDouble.trimmingCharacters(in: CharacterSet.whitespaces)
        if let b = Bool(lettersOrDigits: str) {
            return NSNumber(value: b)
        }
        return factory(intDouble: str)
    }


    /// Returns a number, first tries to convert the string an Int and then a double.

    static func factory(intDouble: String) -> NSNumber? {
        let str = intDouble.trimmingCharacters(in: CharacterSet.whitespaces)
        if let i = Int(str) {
            if str == i.description {
                return NSNumber(value: i)
            }
        }
        if let d = Double(str) {
            return NSNumber(value: d)
        }
        return nil
    }
}


extension Int {
    var isEven: Bool { return self % 2 == 0 }
    var isUneven: Bool { return self % 2 == 1 }
    func isMultiple(of i: Int) -> Bool { return self % i == 0 }
}


public extension Date {
    
    /// Returns a DateComponents object that includes the .year, .month, .day of self for the given calendar or (if absent) the current calendar.
    
    func yearMonthDay(calendar: Calendar? = nil) -> DateComponents {
        let calendar = calendar ?? Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return components
    }
    
    
    /// Returns a DateComponents object that includes the .hour, .minute, .second of self for the given calendar or (if absent) the current calendar.

    func hourMinuteSecond(calendar: Calendar? = nil) -> DateComponents {
        let calendar = calendar ?? Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)
        return components
    }
    
    
    /// Milli seconds since 1 Jan 1970
    
    var javaDate: Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    
    /// Seconds since 1 Jan 1970
    
    var unixTime: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    
    
    /// The javaDate for begin-of-day of self
    
    var javaDateBeginOfDay: Int64 {
        return Calendar.current.startOfDay(for: self).javaDate
    }
    
    
    /// The javaDate for the beginning of tomorrow.
    
    var javaDateBeginOfTomorrow: Int64 {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!.javaDateBeginOfDay
    }

    
    /// The javaDate for the beginning of yesterday.
    
    var javaDateBeginOfYesterday: Int64 {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!.javaDateBeginOfDay
    }

    
    /// The javaDate for the beginning of the week self is in
    
    var javaDateBeginOfWeek: Int64 {
        return Calendar.current.date(bySetting: .weekday, value: 1, of: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaDate for the beginning of the next week
    
    var javaDateBeginOfNextWeek: Int64 {
        let aDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: self)!
        return Calendar.current.date(bySetting: .weekday, value: 1, of: aDate)!.javaDateBeginOfDay
    }
    

    /// The javaDate for the beginning of the month self is in
    
    var javaDateBeginOfMonth: Int64 {
        return Calendar.current.date(bySetting: .day, value: 1, of: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaData for the beginning of next month
    
    var javaDateBeginOfNextMonth: Int64 {
        let aDate = Calendar.current.date(byAdding: .month, value: 1, to: self)!
        return Calendar.current.date(bySetting: .day, value: 1, of: aDate)!.javaDateBeginOfDay
    }
    
    
    /// Create a new Date object.
    ///
    /// - Parameter value: The number of milli seconds since 1 Jan 1970
    
    static func fromJavaDate(_ value: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(value / 1000))
    }
    
    
    /// Create a new Date object.
    ///
    /// - Parameter value: The number of seconds since 1 Jan 1970
    
    static func fromUnixTime(_ value: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(value))
    }
}


// Exstending pointer access to typed values

public extension UnsafeRawPointer {
    
    mutating func advanceBool() -> Bool {
        let val = self.advanceUInt8()
        if val == 0 { return false }
        return true
    }
    
    mutating func advanceUInt8() -> UInt8 {
        let val = self.assumingMemoryBound(to: UInt8.self).pointee
        self = self.advanced(by: 1)
        return val
    }
    
    mutating func advanceInt8() -> Int8 {
        let val = self.assumingMemoryBound(to: Int8.self).pointee
        self = self.advanced(by: 1)
        return val
    }
    
    mutating func advanceUInt16(endianness: Endianness) -> UInt16 {
        var val = self.assumingMemoryBound(to: UInt16.self).pointee
        self = self.advanced(by: 2)
        if endianness != machineEndianness { val = val.byteSwapped }
        return val
    }
    
    mutating func advanceInt16(endianness: Endianness) -> Int16 {
        var val = self.assumingMemoryBound(to: Int16.self).pointee
        self = self.advanced(by: 2)
        if endianness != machineEndianness { val = val.byteSwapped }
        return val
    }
    
    mutating func advanceUInt32(endianness: Endianness) -> UInt32 {
        var val = self.assumingMemoryBound(to: UInt32.self).pointee
        self = self.advanced(by: 4)
        if endianness != machineEndianness { val = val.byteSwapped }
        return val
    }
    
    mutating func advanceInt32(endianness: Endianness) -> Int32 {
        var val = self.assumingMemoryBound(to: Int32.self).pointee
        self = self.advanced(by: 4)
        if endianness != machineEndianness { val = val.byteSwapped }
        return val
    }
    
    mutating func advanceUInt64(endianness: Endianness) -> UInt64 {
        var val = self.assumingMemoryBound(to: UInt64.self).pointee
        self = self.advanced(by: 8)
        if endianness != machineEndianness { val = val.byteSwapped }
        return val
    }
    
    mutating func advanceInt64(endianness: Endianness) -> Int64 {
        var val = self.assumingMemoryBound(to: Int64.self).pointee
        self = self.advanced(by: 8)
        if endianness != machineEndianness { val = val.byteSwapped }
        return val
    }
    
    mutating func advanceFloat32(endianness: Endianness) -> Float32 {
        var val = self.assumingMemoryBound(to: UInt32.self).pointee
        self = self.advanced(by: 4)
        if endianness != machineEndianness { val = val.byteSwapped }
        return Float32(bitPattern: val)
    }
    
    mutating func advanceFloat64(endianness: Endianness) -> Float64 {
        var val = self.assumingMemoryBound(to: UInt64.self).pointee
        self = self.advanced(by: 8)
        if endianness != machineEndianness { val = val.byteSwapped }
        return Float64(bitPattern: val)
    }
    
    mutating func advanceData(count: Int) -> Data {
        let data = Data(bytes: self, count: count)
        self = self.advanced(by: count)
        return data
    }
    
    mutating func advanceUtf8(count: Int) -> String? {
        let data = Data(bytes: self, count: count)
        self = self.advanced(by: count)
        return String(data: data, encoding: .utf8)
    }
}

// CRC-32 table taken from: https://gist.github.com/JALsnipe/e9ad8ba24945e26f10300a18d55a2310
//
//  crc32.swift
//  SuperSFV
//
//  Created by C.W. Betts on 8/23/15.
//
//
/* crc32.swift -- compute the CRC-32 of a data stream
 Copyright (C) 1995-1998 Mark Adler
 Copyright (C) 2015 C.W. "Madd the Sane" Betts
 
 This software is provided 'as-is', without any express or implied
 warranty.  In no event will the authors be held liable for any damages
 arising from the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:
 
 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software. If you use this software
 in a product, an acknowledgment in the product documentation would be
 appreciated but is not required.
 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.
 3. This notice may not be removed or altered from any source distribution.
 
 Jean-loup Gailly        Mark Adler
 jloup@gzip.org          madler@alumni.caltech.edu
 */

// Migrated to Swift 3 by Josh Lieberman

fileprivate let crc32Table: [UInt32] = [
    0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419,
    0x706af48f, 0xe963a535, 0x9e6495a3, 0x0edb8832, 0x79dcb8a4,
    0xe0d5e91e, 0x97d2d988, 0x09b64c2b, 0x7eb17cbd, 0xe7b82d07,
    0x90bf1d91, 0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de,
    0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7, 0x136c9856,
    0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9,
    0xfa0f3d63, 0x8d080df5, 0x3b6e20c8, 0x4c69105e, 0xd56041e4,
    0xa2677172, 0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
    0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940, 0x32d86ce3,
    0x45df5c75, 0xdcd60dcf, 0xabd13d59, 0x26d930ac, 0x51de003a,
    0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423, 0xcfba9599,
    0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
    0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d, 0x76dc4190,
    0x01db7106, 0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f,
    0x9fbfe4a5, 0xe8b8d433, 0x7807c9a2, 0x0f00f934, 0x9609a88e,
    0xe10e9818, 0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
    0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e, 0x6c0695ed,
    0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
    0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3,
    0xfbd44c65, 0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2,
    0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a,
    0x346ed9fc, 0xad678846, 0xda60b8d0, 0x44042d73, 0x33031de5,
    0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa, 0xbe0b1010,
    0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
    0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17,
    0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6,
    0x03b6e20c, 0x74b1d29a, 0xead54739, 0x9dd277af, 0x04db2615,
    0x73dc1683, 0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8,
    0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1, 0xf00f9344,
    0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
    0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a,
    0x67dd4acc, 0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
    0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252, 0xd1bb67f1,
    0xa6bc5767, 0x3fb506dd, 0x48b2364b, 0xd80d2bda, 0xaf0a1b4c,
    0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55, 0x316e8eef,
    0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
    0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe,
    0xb2bd0b28, 0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31,
    0x2cd99e8b, 0x5bdeae1d, 0x9b64c2b0, 0xec63f226, 0x756aa39c,
    0x026d930a, 0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
    0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38, 0x92d28e9b,
    0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
    0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1,
    0x18b74777, 0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c,
    0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45, 0xa00ae278,
    0xd70dd2ee, 0x4e048354, 0x3903b3c2, 0xa7672661, 0xd06016f7,
    0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc, 0x40df0b66,
    0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
    0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605,
    0xcdd70693, 0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8,
    0x5d681b02, 0x2a6f2b94, 0xb40bbe37, 0xc30c8ea1, 0x5a05df1b,
    0x2d02ef8d]


public extension Data {
    
    /// Calculates a 16 bit CRC over the content of self.
    ///
    /// - Parameters:
    ///   - initialValue: Use 0 for an ARC CRC value (default) or 0xFFFF for the MODBUS CRC.
    ///   - polynomial: The polynomial to be used, default is 0xA001 (= 0x8005 reversed).
    
    func crc16(initialValue: UInt16 = 0, polynomial: UInt16 = 0xA001) -> UInt16 {
        if isEmpty { return initialValue }
        var accumulator: UInt16 = initialValue
        for byte in self {
            var tempByte = UInt16(byte)
            for _ in 0 ..< 8 {
                let temp1 = accumulator & 0x0001
                accumulator = accumulator >> 1
                let temp2 = tempByte & 0x0001
                tempByte = tempByte >> 1
                if (temp1 ^ temp2) == 1 {
                    accumulator = accumulator ^ polynomial
                }
            }
        }
        return accumulator
    }
    
    func crc32(initialValue: UInt32 = 0) -> UInt32 {
        let value = reduce(initialValue ^ 0xffffffff, { (value, byte) -> UInt32 in
            return crc32Table[Int(UInt8(value & 0xff) ^ byte)] ^ (value >> 8)
        })
        return value ^ 0xffffffff
    }
}
