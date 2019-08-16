// =====================================================================================================================
//
//  File:       Array.Extensions.swift
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


public extension Array {
    
    
    /// Removes the given object from the array.
    ///
    /// - Parameter object: The Object to remove from the array.
    ///
    /// - Returns: Nil if the object was not found in the array, otherwise the object itself.
    
    @discardableResult
    mutating func removeObject<T: AnyObject>(object: T) -> T? {
        for (i, obj) in self.enumerated() {
            if obj as? T === object {
                return self.remove(at: i) as? T
            }
        }
        return nil
    }
    
    
    /// - Returns: The range for this array that encompasses the entire array.
    
    var range: Range<Array.Index> {
        return Range.init(uncheckedBounds: (lower: self.startIndex, upper: self.endIndex))
    }
    
    
    /// Limits the given integer to a valid index.
    ///
    /// - Parameter index: The index to be limied to the available indicies.
    ///
    /// - Returns: The given index clamped to either self.startIndex or self.endIndex.
    
    func clamp(index: Int) -> Int {
        if index < self.startIndex { return self.startIndex }
        if index > self.endIndex { return self.endIndex }
        return index
    }
}
