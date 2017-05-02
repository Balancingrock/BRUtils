// =====================================================================================================================
//
//  File:       GlobalFunctions.swift
//  Project:    BRUtils
//
//  Version:    0.3.0
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
// 0.3.0 - Initial release
//
// =====================================================================================================================
// Description
// =====================================================================================================================
//
// General purpose functions.
//
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
