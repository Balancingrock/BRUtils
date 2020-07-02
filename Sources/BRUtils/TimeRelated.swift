// =====================================================================================================================
//
//  File:       TimeRelated.swift
//  Project:    BRUtils
//
//  Version:    1.1.4
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2017-2020 Marinus van der Lugt, All rights reserved.
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
// 1.1.4 - Made defs public
// 1.1.3 - Added linux compatibility
// 1.1.2 - Added linux compatibility
// 1.0.0 - Removed older history
// =====================================================================================================================

import Foundation

#if os(Linux)

public let MSEC_PER_SEC = 1000
public let USEC_PER_SEC = 1000 * 1000
public let NSEC_PER_SEC = 1000 * 1000 * 1000

#endif

/// Extends the Darwin defined timespec type.

public extension timespec {

    
    /// Create a timespec (nsec resolution) from a TimeInterval.
    
    init(timeInterval: TimeInterval) {
        let sec = Int(timeInterval)
        let nsec = Int((timeInterval - Double(sec)) * Double(NSEC_PER_SEC))
        self.init(tv_sec: sec, tv_nsec: nsec)
    }
}


/// Extends the Darwin defined timeval type.

public extension timeval {
    
    
    /// Create a timeval (usec resolution) from a TimeInterval.

    init(timeInterval: TimeInterval) {
        let sec = Int(timeInterval)
        #if os(Linux)
        let usec = Int((timeInterval - Double(sec)) * Double(USEC_PER_SEC))
        #else
        let usec = Int32((timeInterval - Double(sec)) * Double(USEC_PER_SEC))
        #endif
        self.init(tv_sec: sec, tv_usec: usec)
    }
}


// Extends the foundation defined TimeInterval type.

public extension TimeInterval {
    
    
    /// Create a TimeInterval from a timespec (nsec resolution)
    
    init(timespec: timespec) {
        self.init(Double(timespec.tv_sec) + (Double(timespec.tv_nsec) / Double(NSEC_PER_SEC)))
    }
    
    
    /// Create a TimeInterval from a timeval (usec resolution)

    init(timeval: timeval) {
        self.init(Double(timeval.tv_sec) + (Double(timeval.tv_usec) / Double(USEC_PER_SEC)))
    }
}


/// A wrapper for the POSIX call 'nanosleep'
///
/// - Parameter duration: The time to suspend the current thread.
/// - Returns: nil if the delay was successful or the remaining time that has not expired yet.

public func sleep(_ duration: TimeInterval) -> TimeInterval? {

    var requested = timespec(timeInterval: duration)
    var remainder: timespec = timespec()

    if nanosleep(&requested, &remainder) != 0 {
        return TimeInterval(timespec: remainder)
    } else {
        return nil
    }
}
