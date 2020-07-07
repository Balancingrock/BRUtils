// =====================================================================================================================
//
//  File:       Endianness.swift
//  Project:    BRUtils
//
//  Version:    1.1.5
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2017-2020 Marinus van der Lugt, All rights reserved.
//
//  License:    MIT, see LICENSE file
//
//  And because I need to make a living:
//
//   - You can send payment (you choose the amount) via paypal to: sales@balancingrock.nl
//   - Or wire bitcoins to: 1GacSREBxPy1yskLMc9de2nofNv2SNdwqH
//
//  If you like to pay in another way, please contact me at rien@balancingrock.nl
//
//  Prices/Quotes for support, modifications or enhancements can be obtained from: rien@balancingrock.nl
//
// =====================================================================================================================
// Let me know about bugs, improvements and feature requests at: rien@balancingrock.nl
// =====================================================================================================================
//
// History
//
// 1.1.5 - Update license
// 1.0.0 - Removed older history
// =====================================================================================================================

import Foundation


/// The endianess type

public enum Endianness {
    
    
    /// MSB before LSB
    
    case big
    
    
    /// LSB before MSB
    
    case little
}


/// The endianness of the local computer

public let machineEndianness: Endianness = {
    func test(_ ptr: UnsafePointer<UInt16>) -> Endianness {
        let mptr = UnsafeRawPointer(ptr)
        let nptr = mptr.assumingMemoryBound(to: UInt8.self)
        if nptr.pointee == 0 {
            return .big
        } else {
            return .little
        }
    }
    var val: UInt16 = 1
    return test(&val)
}()
