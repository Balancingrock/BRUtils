//
//  GlobalFunctions.swift
//  BRUtils
//
//  Created by Marinus van der Lugt on 19/04/17.
//
//

import Foundation

   
/// Returns a tuple with the input values sorted as minimum and maximum value.

func gf_minmax<T: Comparable>(_ first: T, second: T) -> (min: T, max: T) {
    let rmin = min(first, second)
    let rmax = max(first, second)
    return (rmin, rmax)
}


/// Returns a tuple with the input values sorted as minimum and maximum value. The minimum value will be at least as high as the lowLimit and the maximum value will be no higher than the highLimit.

func gf_clippedMinMax<T: Comparable>(lowLimit: T, first: T, second: T, highLimit: T) -> (min: T, max: T) {
    let clippedFirst = max(lowLimit, min(highLimit, first))
    let clippedSecond = min(highLimit, max(lowLimit, second))
    return gf_minmax(clippedFirst, second: clippedSecond)
}


/// Does not return a value outside the high and low limits

func gf_clippedValue<T: Comparable>(lowLimit: T, value: T, highLimit: T) -> T {
    if value < lowLimit { return lowLimit }
    if value > highLimit { return highLimit }
    return value
}


/// Returns a value lower or equal to max

func gf_limitToMax<T: Comparable>(_ value: T, max: T) -> T {
    if value > max { return max }
    return value
}


/// Returns a value higher or equal to min

func gf_limitToMin<T: Comparable>(_ value: T, min: T) -> T {
    if value < min { return min }
    return value
}
