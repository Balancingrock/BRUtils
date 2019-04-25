// =====================================================================================================================
//
//  File:       Clamped.UInt.swift
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
// 0.13.0 - Removed warnings for Swift 5
// 0.7.0 - Initial release
//
// =====================================================================================================================

import Foundation


public extension UInt {
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int) -> UInt {
        if value <= 0 {
            return 0
        } else {
            return UInt(value)
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int8) -> UInt {
        if value <= 0 {
            return 0
        } else {
            return UInt(value)
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int16) -> UInt {
        if value <= 0 {
            return 0
        } else {
            return UInt(value)
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    
    static func clamped(_ value: Int32) -> UInt {
        if value <= 0 {
            return 0
        } else {
            return UInt(value)
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int64) -> UInt {
        if MemoryLayout<Int>.size == 4 {
            // 32 bit Int
            if value <= 0 {
                return 0
            } else if UInt64(value) > UInt64(UInt.max) {
                return UInt.max
            } else {
                return UInt(value)
            }
        } else {
            // 64 bit Int
            if value <= 0 {
                return 0
            } else {
                return UInt(value)
            }
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt) -> UInt {
        return value
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt8) -> UInt {
        return UInt(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt16) -> UInt {
        return UInt(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt32) -> UInt {
        return UInt(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt64) -> UInt {
        return UInt(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Float, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> UInt {
        if value <= Float(0) {
            return 0
        } else if value >= Float(UInt.max) {
            return UInt.max
        } else {
            return UInt(value.rounded(rounding))
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Double, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> UInt {
        if value <= Double(0) {
            return 0
        } else if value >= Double(UInt.max) {
            return UInt.max
        } else {
            return UInt(value.rounded(rounding))
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Float80, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> UInt {
        if value <= Float80(0) {
            return 0
        } else if value >= Float80(UInt.max) {
            return UInt.max
        } else {
            return UInt(value.rounded(rounding))
        }
    }
    
    
    #if os(OSX)
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: NSNumber, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> UInt {
        return UInt.clamped(value.doubleValue, rounding: rounding)
    }
    
    #endif
}
