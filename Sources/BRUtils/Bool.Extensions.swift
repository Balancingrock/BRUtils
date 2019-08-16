// =====================================================================================================================
//
//  File:       Bool.Extensions.swift
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


