// =====================================================================================================================
//
//  File:       Date.Extensions.swift
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


public extension Date {
    
    
    /// Returns a DateComponents object that includes the .year, .month, .day of self for the given calendar or (if absent) the current calendar.
    
    func yearMonthDay(calendar: Calendar? = nil) -> DateComponents {
        let calendar = calendar ?? Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return components
    }
    
    
    /// Returns a DateComponents object that includes the .hour, .minute, .second of self for the given calendar or (if absent) the current calendar.
    
    func hourMinuteSecond(calendar: Calendar? = nil) -> DateComponents {
        let calendar = calendar ?? Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)
        return components
    }
    
    
    /// Milli seconds since 1 Jan 1970
    
    var javaDate: Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    
    /// Seconds since 1 Jan 1970
    
    var unixTime: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    
    
    /// The javaDate for begin-of-day of self
    
    var javaDateBeginOfDay: Int64 {
        return Calendar.current.startOfDay(for: self).javaDate
    }
    
    
    /// The javaDate for the beginning of tomorrow.
    
    var javaDateBeginOfTomorrow: Int64 {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaDate for the beginning of yesterday.
    
    var javaDateBeginOfYesterday: Int64 {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaDate for the beginning of the week self is in
    
    var javaDateBeginOfWeek: Int64 {
        return Calendar.current.date(bySetting: .weekday, value: 1, of: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaDate for the beginning of the next week
    
    var javaDateBeginOfNextWeek: Int64 {
        let aDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: self)!
        return Calendar.current.date(bySetting: .weekday, value: 1, of: aDate)!.javaDateBeginOfDay
    }
    
    
    /// The javaDate for the beginning of the month self is in
    
    var javaDateBeginOfMonth: Int64 {
        return Calendar.current.date(bySetting: .day, value: 1, of: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaData for the beginning of next month
    
    var javaDateBeginOfNextMonth: Int64 {
        let aDate = Calendar.current.date(byAdding: .month, value: 1, to: self)!
        return Calendar.current.date(bySetting: .day, value: 1, of: aDate)!.javaDateBeginOfDay
    }
    
    
    /// Create a new Date object.
    ///
    /// - Parameter value: The number of milli seconds since 1 Jan 1970
    
    static func fromJavaDate(_ value: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(value / 1000))
    }
    
    
    /// Create a new Date object.
    ///
    /// - Parameter value: The number of seconds since 1 Jan 1970
    
    static func fromUnixTime(_ value: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(value))
    }
}
