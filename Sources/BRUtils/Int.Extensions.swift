// =====================================================================================================================
//
//  File:       Int.Extensions.swift
//  Project:    BRUtils
//
//  Version:    1.1.5
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2019-2020 Marinus van der Lugt, All rights reserved.
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


public extension Int {

    
    /// - Returns: True if the integer is even.
    
    var isEven: Bool { return self % 2 == 0 }

    
    /// - Returns: True if the integer is uneven.
    
    var isUneven: Bool { return self % 2 == 1 }

    
    /// - Returns: True if the integer is a multiple of the given number.
    
    func isMultiple(of i: Int) -> Bool { return self % i == 0 }
}

