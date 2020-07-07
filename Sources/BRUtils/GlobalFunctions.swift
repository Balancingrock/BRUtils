// =====================================================================================================================
//
//  File:       GlobalFunctions.swift
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

   
/// Returns a tuple with the input values sorted as minimum and maximum value.

public func minmax<T: Comparable>(_ first: T, _ second: T) -> (min: T, max: T) {
    let rmin = min(first, second)
    let rmax = max(first, second)
    return (rmin, rmax)
}


/// Returns a tuple with the input values sorted as minimum and maximum value. The minimum value will be at least as high as the lowLimit and the maximum value will be no higher than the highLimit.
///
/// - Parameters:
///   - lowLimit: The lower limit for either first or second.
///   - first: The first value ot be sorted.
///   - second: The second value to be sorted.
///   - highLimit: The higher limit for either first or second.
///
/// - Returns: A tuble where the first value is lower or equal to the second value and neither value is below the lowLimit or above the high limit.

public func minMax<T: Comparable>(lowLimit: T, _ first: T, _ second: T, highLimit: T) -> (min: T, max: T) {
    let clippedFirst = max(lowLimit, min(highLimit, first))
    let clippedSecond = min(highLimit, max(lowLimit, second))
    return minmax(clippedFirst, clippedSecond)
}


/// Does not return a value outside the high and low limits.
///
/// - Parameters:
///   - lowLimit: The lowest value that may be returned.
///   - value: The value that will be returned if it is now lower than lowLimit or higher than highLimit.
///   - highLimit: The highest value that will be returned.
///
/// - Returns: Avalue between lowLimit and highLimit.

public func limit<T: Comparable>(lowLimit: T, _ value: T, highLimit: T) -> T {
    if value < lowLimit { return lowLimit }
    if value > highLimit { return highLimit }
    return value
}

