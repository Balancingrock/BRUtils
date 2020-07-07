// =====================================================================================================================
//
//  File:       Date.Extensions.swift
//  Project:    BRUtils
//
//  Version:    1.1.5
//
//  Author:     Marinus van der Lugt
//  Company:    http://balancingrock.nl
//  Website:    http://swiftfire.nl/
//  Git:        https://github.com/Balancingrock/Swiftfire
//
//  Copyright:  (c) 2019, 2020 Marinus van der Lugt, All rights reserved.
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
    
    
    /// Create a new Date from the given javaDate.
    
    init(javaDate: Int64) {
        self.init(timeIntervalSince1970: Double(javaDate / 1000))
    }
    
    
    /// Create a new Date from the given unixTime.
    
    init(unixTime: Int64) {
        self.init(timeIntervalSince1970: Double(unixTime))
    }
}
