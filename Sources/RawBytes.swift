// =====================================================================================================================
//
//  File:       RawBytes.swift
//  Project:    BRUtils
//
//  Version:    0.8.0
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Blog:       http://swiftrien.blogspot.com
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2017 Marinus van der Lugt, All rights reserved.
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
// 0.9.0 - Added data member to RawBytes protocol
// 0.8.0 - Initial release
//
// =====================================================================================================================

import Foundation


public protocol RawBytes {
    
    
    /// Returns the raw bytes that encode this item.
    ///
    /// - Note: For integer values the bytes _should_ be in order of declining significance.
    ///
    /// - Note: For all implementations, when the value returned here is supplied to the 'init' operation also specified in this protocol the result _must_ be a duplicate object.
    ///
    /// - Note: This protocol does not specify what should be done with references contained in the type.
    
    var rawBytes: Array<UInt8> { get }
    
    
    /// When all necessary bytes are provided, this operation should produce a new object with the exact same contents as the object from which the bytes were derived - if derived by 'rawBytes' also defined in this protocol.
    ///
    /// - Returns: Nil if not enough bytes are present or when the bytes are not compatible. Otherwise a properly constructed object.
    
    init?(rawBytes: inout Array<UInt8>)
    
    
    /// Represent the raw bytes in a data type.
    ///
    /// Note: There is a default implementation for this member.
    
    var data: Data { get }
}

extension RawBytes {
    
    public var data: Data { return Data(bytes: self.rawBytes) }
}

extension Bool: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        return self ? [0x01] : [0x00]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 1 { return nil }
        self = (0x01 == rawBytes.removeFirst())
    }
}

extension UInt8: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        return [self]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 1 { return nil }
        self = rawBytes.removeFirst()
    }
}

extension Int8: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        return [UInt8.init(bitPattern: self)]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 1 { return nil }
        self = Int8(bitPattern: rawBytes.removeFirst())
    }
}

extension UInt16: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        let lb = UInt8(self & 0xFF)
        let hb = UInt8((self >> 8) & 0xFF)
        return [hb, lb]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 2 { return nil }
        let hb = UInt16(rawBytes.removeFirst())
        let lb = UInt16(rawBytes.removeFirst())
        self = (hb << 8) | lb
    }
}

extension Int16: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        let lb = UInt8(self & 0xFF)
        let hb = UInt8((self >> 8) & 0xFF)
        return [hb, lb]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 2 { return nil }
        let hb = Int16(rawBytes.removeFirst())
        let lb = Int16(rawBytes.removeFirst())
        self = (hb << 8) | lb
    }
}

extension UInt32: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        let llb = UInt8(self & 0xFF)
        let lhb = UInt8((self >> 8) & 0xFF)
        let hlb = UInt8((self >> 16) & 0xFF)
        let hhb = UInt8((self >> 24) & 0xFF)
        return [hhb, hlb, lhb, llb]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 4 { return nil }
        let hhb = UInt32(rawBytes.removeFirst())
        let hlb = UInt32(rawBytes.removeFirst())
        let lhb = UInt32(rawBytes.removeFirst())
        let llb = UInt32(rawBytes.removeFirst())
        self = (hhb << 24) | (hlb << 16) | (lhb << 8) | llb
    }
}

extension Int32: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        let llb = UInt8(self & 0xFF)
        let lhb = UInt8((self >> 8) & 0xFF)
        let hlb = UInt8((self >> 16) & 0xFF)
        let hhb = UInt8((self >> 24) & 0xFF)
        return [hhb, hlb, lhb, llb]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 4 { return nil }
        let hhb = Int32(rawBytes.removeFirst())
        let hlb = Int32(rawBytes.removeFirst())
        let lhb = Int32(rawBytes.removeFirst())
        let llb = Int32(rawBytes.removeFirst())
        self = (hhb << 24) | (hlb << 16) | (lhb << 8) | llb
    }
}

extension UInt64: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        let lllb = UInt8(self & 0xFF)
        let llhb = UInt8((self >> 8) & 0xFF)
        let lhlb = UInt8((self >> 16) & 0xFF)
        let lhhb = UInt8((self >> 24) & 0xFF)
        let hllb = UInt8((self >> 32) & 0xFF)
        let hlhb = UInt8((self >> 40) & 0xFF)
        let hhlb = UInt8((self >> 48) & 0xFF)
        let hhhb = UInt8((self >> 56) & 0xFF)
        return [hhhb, hhlb, hlhb, hllb, lhhb, lhlb, llhb, lllb]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 8 { return nil }
        let hhhb = UInt64(rawBytes.removeFirst())
        let hhlb = UInt64(rawBytes.removeFirst())
        let hlhb = UInt64(rawBytes.removeFirst())
        let hllb = UInt64(rawBytes.removeFirst())
        let lhhb = UInt64(rawBytes.removeFirst())
        let lhlb = UInt64(rawBytes.removeFirst())
        let llhb = UInt64(rawBytes.removeFirst())
        let lllb = UInt64(rawBytes.removeFirst())
        self = (hhhb << 56) | (hhlb << 48) | (hlhb << 40) | (hllb << 32) | (lhhb << 24) | (lhlb << 16) | (llhb << 8) | lllb
    }
}

extension Int64: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        let lllb = UInt8(self & 0xFF)
        let llhb = UInt8((self >> 8) & 0xFF)
        let lhlb = UInt8((self >> 16) & 0xFF)
        let lhhb = UInt8((self >> 24) & 0xFF)
        let hllb = UInt8((self >> 32) & 0xFF)
        let hlhb = UInt8((self >> 40) & 0xFF)
        let hhlb = UInt8((self >> 48) & 0xFF)
        let hhhb = UInt8((self >> 56) & 0xFF)
        return [hhhb, hhlb, hlhb, hllb, lhhb, lhlb, llhb, lllb]
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 8 { return nil }
        let hhhb = Int64(rawBytes.removeFirst())
        let hhlb = Int64(rawBytes.removeFirst())
        let hlhb = Int64(rawBytes.removeFirst())
        let hllb = Int64(rawBytes.removeFirst())
        let lhhb = Int64(rawBytes.removeFirst())
        let lhlb = Int64(rawBytes.removeFirst())
        let llhb = Int64(rawBytes.removeFirst())
        let lllb = Int64(rawBytes.removeFirst())
        self = (hhhb << 56) | (hhlb << 48) | (hlhb << 40) | (hllb << 32) | (lhhb << 24) | (lhlb << 16) | (llhb << 8) | lllb
    }
}

extension UInt: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        if MemoryLayout<Int>.size == 4 {
            return UInt32(self).rawBytes
        } else {
            return UInt64(self).rawBytes
        }
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if MemoryLayout<Int>.size == 4 {
            if let i = UInt32(rawBytes: &rawBytes) {
                self = UInt(i)
            } else {
                return nil
            }
        } else {
            if let i = UInt64(rawBytes: &rawBytes) {
                self = UInt(i)
            } else {
                return nil
            }
        }
    }
}

extension Int: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        if MemoryLayout<Int>.size == 4 {
            return Int32(self).rawBytes
        } else {
            return Int64(self).rawBytes
        }
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if MemoryLayout<Int>.size == 4 {
            if let i = Int32(rawBytes: &rawBytes) {
                self = Int(i)
            } else {
                return nil
            }
        } else {
            if let i = Int64(rawBytes: &rawBytes) {
                self = Int(i)
            } else {
                return nil
            }
        }
    }
}

extension Float: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        return self.bitPattern.rawBytes
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 4 { return nil }
        let hhb = UInt32(rawBytes.removeFirst())
        let hlb = UInt32(rawBytes.removeFirst())
        let lhb = UInt32(rawBytes.removeFirst())
        let llb = UInt32(rawBytes.removeFirst())
        self = Float(bitPattern: (hhb << 24) | (hlb << 16) | (lhb << 8) | llb)
    }
}

extension Double: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        return self.bitPattern.rawBytes
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if rawBytes.count < 8 { return nil }
        let hhhb = UInt64(rawBytes.removeFirst())
        let hhlb = UInt64(rawBytes.removeFirst())
        let hlhb = UInt64(rawBytes.removeFirst())
        let hllb = UInt64(rawBytes.removeFirst())
        let lhhb = UInt64(rawBytes.removeFirst())
        let lhlb = UInt64(rawBytes.removeFirst())
        let llhb = UInt64(rawBytes.removeFirst())
        let lllb = UInt64(rawBytes.removeFirst())
        self = Double(bitPattern: (hhhb << 56) | (hhlb << 48) | (hlhb << 40) | (hllb << 32) | (lhhb << 24) | (lhlb << 16) | (llhb << 8) | lllb)
    }
}

extension String: RawBytes {
    
    public var rawBytes: Array<UInt8> {
        return Array(self.utf8)
    }
    
    public init?(rawBytes: inout Array<UInt8>) {
        if let str = String(bytes: rawBytes, encoding: .utf8) {
            self = str
            rawBytes.removeAll()
        } else {
            return nil
        }
    }
}

public extension Data {
    
    public mutating func append(_ item: RawBytes) {
        self.append(contentsOf: item.rawBytes)
    }
    
    public mutating func removeFirstInt8() -> Int8? {
        guard self.count > 0 else { return nil }
        return Int8(bitPattern: removeFirst())
    }
    
    public mutating func removeFirstUInt8() -> UInt8? {
        guard self.count > 0 else { return nil }
        return removeFirst()
    }
    
    public mutating func removeFirstInt16() -> Int16? {
        guard count > 1 else { return nil }
        let h = removeFirst()
        let l = removeFirst()
        return (Int16(h) << 8) | Int16(l)
    }
    
    public mutating func removeFirstUInt16() -> UInt16? {
        guard count > 1 else { return nil }
        let h = removeFirst()
        let l = removeFirst()
        return (UInt16(h) << 8) | UInt16(l)
    }
    
    public mutating func removeFirstInt32() -> Int32? {
        guard count > 3 else { return nil }
        let hh = removeFirst()
        let hl = removeFirst()
        let lh = removeFirst()
        let ll = removeFirst()
        return (Int32(hh) << 24) | (Int32(hl) << 16) | (Int32(lh) << 8) | Int32(ll)
    }
    
    public mutating func removeFirstUInt32() -> UInt32? {
        guard count > 3 else { return nil }
        let hh = removeFirst()
        let hl = removeFirst()
        let lh = removeFirst()
        let ll = removeFirst()
        return (UInt32(hh) << 24) | (UInt32(hl) << 16) | (UInt32(lh) << 8) | UInt32(ll)
    }

    public mutating func removeFirstInt64() -> Int64? {
        guard count > 7 else { return nil }
        let hhh = removeFirst()
        let hhl = removeFirst()
        let hlh = removeFirst()
        let hll = removeFirst()
        let lhh = removeFirst()
        let lhl = removeFirst()
        let llh = removeFirst()
        let lll = removeFirst()
        return (Int64(hhh) << 56) | (Int64(hhl) << 48) | (Int64(hlh) << 40) | (Int64(hll) << 32) | (Int64(lhh) << 24) | (Int64(lhl) << 16) | (Int64(llh) << 8) | Int64(lll)
    }

    public mutating func removeFirstUInt64() -> UInt64? {
        guard count > 7 else { return nil }
        let hhh = removeFirst()
        let hhl = removeFirst()
        let hlh = removeFirst()
        let hll = removeFirst()
        let lhh = removeFirst()
        let lhl = removeFirst()
        let llh = removeFirst()
        let lll = removeFirst()
        return (UInt64(hhh) << 56) | (UInt64(hhl) << 48) | (UInt64(hlh) << 40) | (UInt64(hll) << 32) | (UInt64(lhh) << 24) | (UInt64(lhl) << 16) | (UInt64(llh) << 8) | UInt64(lll)
    }
    
    public mutating func removeFirstFloat() -> Float? {
        guard count > 3 else { return nil }
        let hh = removeFirst()
        let hl = removeFirst()
        let lh = removeFirst()
        let ll = removeFirst()
        let bits = (UInt32(hh) << 24) | (UInt32(hl) << 16) | (UInt32(lh) << 8) | UInt32(ll)
        return Float(bitPattern: bits)
    }

    public mutating func removeFirstDouble() -> Double? {
        guard count > 7 else { return nil }
        let hhh = removeFirst()
        let hhl = removeFirst()
        let hlh = removeFirst()
        let hll = removeFirst()
        let lhh = removeFirst()
        let lhl = removeFirst()
        let llh = removeFirst()
        let lll = removeFirst()
        let bits = (UInt64(hhh) << 56) | (UInt64(hhl) << 48) | (UInt64(hlh) << 40) | (UInt64(hll) << 32) | (UInt64(lhh) << 24) | (UInt64(lhl) << 16) | (UInt64(llh) << 8) | UInt64(lll)
        return Double(bitPattern: bits)
    }

    public mutating func removeFirstUtf8CString() -> String? {
        if let endOfStringIndex = index(of: 0x00) {
            let stringData = subdata(in: Range(uncheckedBounds: (lower: 0, upper: endOfStringIndex)))
            if let str = String(data: stringData, encoding: .utf8) {
                removeFirst(endOfStringIndex + 1)
                return str
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

