// =====================================================================================================================
//
//  File:       FunctionResult.swift
//  Project:    BRUtils
//
//  Version:    0.4.0
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
// 0.4.0 - Added '+' Result<Bool>
// 0.1.0 - Initial release
//
// =====================================================================================================================
// Description
// =====================================================================================================================
//
// General purpose function result with associated functions.
//
// =====================================================================================================================

import Foundation


/// A general purpose return value. Possible values are:
///
/// - error(message: String)
/// - success(<T>)

public enum Result<T> {
    
    
    // An error occured. The message details the kind of error.
    
    case error(message: String)
    
    
    // The operation was sucessfull. The result is contained.
    
    case success(T)
}


/// Add to Result<Bool> types together.
///
/// - Returns: An error if either one of the input parameters contains an error. If both contain an error, the messages are combined and separated by a newline. Returns .success if both parameters contain .success with the content set to the 'and' of both associated values.

func + (lhs: Result<Bool>, rhs: Result<Bool>) -> Result<Bool> {
    switch lhs {
    case .error(let lmessage):
        switch rhs {
        case .error(let rmessage): return Result<Bool>.error(message: "\(lmessage)\n\(rmessage)")
        case .success: return Result<Bool>.error(message: lmessage)
        }
    case .success(let lbool):
        switch rhs {
        case .error(let rmessage): return Result<Bool>.error(message: rmessage)
        case .success(let rbool): return Result<Bool>.success(lbool && rbool)
        }
    }
}


/// A wrapper for functions that return a Result<T>
///
/// Executes the given function and returns the unwrapped result. If an error was returned in the function then the onError closure is invoked with the error message. This closure should then return a default value to be used instead.
///
/// - Parameters:
///   - function: The closure that will be executed and evaluated.
///   - onError: The closure that will be executed when the function returned the error case.
///
/// - Returns: On success the value received from the function or on error the default value from the onError closure.

public func result<T>(function: (@autoclosure() -> Result<T>), onError: (String) -> T?) -> T? {
    switch function() {
    case .error(let message): return onError(message)
    case .success(let t): return t
    }
}
