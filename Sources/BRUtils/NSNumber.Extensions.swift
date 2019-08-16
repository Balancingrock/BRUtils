// =====================================================================================================================
//
//  File:       NSNumber.Extensions.swift
//  Project:    BRUtils
//
//  Version:    1.0.0
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2019 Marinus van der Lugt, All rights reserved.
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
//  Like you, I need to make a living:
//
//   - You can send payment (you choose the amount) via paypal to: sales@balancingrock.nl
//   - Or wire bitcoins to: 1GacSREBxPy1yskLMc9de2nofNv2SNdwqH
//
//  If you like to pay in another way, please contact me at rien@balancingrock.nl
//
//  Prices/Quotes for support, modifications or enhancements can be obtained from: rien@balancingrock.nl
//
// =====================================================================================================================
// PLEASE let me know about bugs, improvements and feature requests. (rien@balancingrock.nl)
// =====================================================================================================================
//
// History
//
// 1.0.0 - Removed older history
// =====================================================================================================================

import Foundation


public extension NSNumber {
    
    
    /// Convert a string to an NSNumber.
    ///
    /// The internal number in the NSNumber will be Bool based if possible, of not then Int based, if that too is not possible then it will be Double based.
    ///
    /// - Parameter boolIntDouble: The string to be converted.
    ///
    /// - Returns: The converted number or nil if conversion is not possible.

    static func factory(boolIntDouble: String) -> NSNumber? {
        let str = boolIntDouble.trimmingCharacters(in: CharacterSet.whitespaces)
        if let b = Bool(lettersOrDigits: str) {
            return NSNumber(value: b)
        }
        return factory(intDouble: str)
    }
    
    
    /// Convert a string to an NSNumber.
    ///
    /// The internal number in the NSNumber will be Int based if possible, if not it will be Double based.
    ///
    /// - Parameter intDouble: The string to be converted.
    ///
    /// - Returns: The converted number or nil if conversion is not possible.
    
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
