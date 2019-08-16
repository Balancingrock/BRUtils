// =====================================================================================================================
//
//  File:       GlobalFunctions.swift
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

   
/// Returns a tuple with the input values sorted as minimum and maximum value.

public func gf_minmax<T: Comparable>(_ first: T, second: T) -> (min: T, max: T) {
    let rmin = min(first, second)
    let rmax = max(first, second)
    return (rmin, rmax)
}


/// Returns a tuple with the input values sorted as minimum and maximum value. The minimum value will be at least as high as the lowLimit and the maximum value will be no higher than the highLimit.

public func gf_clippedMinMax<T: Comparable>(lowLimit: T, first: T, second: T, highLimit: T) -> (min: T, max: T) {
    let clippedFirst = max(lowLimit, min(highLimit, first))
    let clippedSecond = min(highLimit, max(lowLimit, second))
    return gf_minmax(clippedFirst, second: clippedSecond)
}


/// Does not return a value outside the high and low limits

public func gf_clippedValue<T: Comparable>(lowLimit: T, value: T, highLimit: T) -> T {
    if value < lowLimit { return lowLimit }
    if value > highLimit { return highLimit }
    return value
}


/// Returns a value lower or equal to max

public func gf_limitToMax<T: Comparable>(_ value: T, max: T) -> T {
    if value > max { return max }
    return value
}


/// Returns a value higher or equal to min

public func gf_limitToMin<T: Comparable>(_ value: T, min: T) -> T {
    if value < min { return min }
    return value
}
