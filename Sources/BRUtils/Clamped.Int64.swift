// =====================================================================================================================
//
//  File:       Clamped.Int64.swift
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


public extension Int64 {
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int8) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    
    static func clamped(_ value: Int16) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    
    static func clamped(_ value: Int32) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Int64) -> Int64 {
        return value
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt) -> Int64 {
        if MemoryLayout<Int>.size == 4 {
            return Int64(value)
        } else {
            if value >= UInt(Int64.max) {
                return Int64.max
            } else {
                return Int64(value)
            }
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt8) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt16) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt32) -> Int64 {
        return Int64(value)
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: UInt64) -> Int64 {
        if value >= UInt64(Int64.max) {
            return Int64.max
        } else {
            return Int64(value)
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Float, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Int64 {
        if value >= Float(Int64.max) {
            return Int64.max
        } else if value <= Float(Int64.min) {
            return Int64.min
        } else {
            return Int64(value.rounded(rounding))
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Double, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Int64 {
        if value >= Double(Int64.max) {
            return Int64.max
        } else if value <= Double(Int64.min) {
            return Int64.min
        } else {
            return Int64(value.rounded(rounding))
        }
    }
    
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: Float80, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Int64 {
        if value >= Float80(Int64.max) {
            return Int64.max
        } else if value <= Float80(Int64.min) {
            return Int64.min
        } else {
            return Int64(value.rounded(rounding))
        }
    }


    #if os(OSX)
    
    /// Creates a new value from the given value clamped to the limits if necessary.
    ///
    /// - Parameter value: The new value.
    
    static func clamped(_ value: NSNumber, rounding: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Int64 {
        return Int64.clamped(value.doubleValue, rounding: rounding)
    }
    
    #endif
}
