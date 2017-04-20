// =====================================================================================================================
//
//  File:       Extensions.swift
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
//  Copyright:  (c) 2014-2017 Marinus van der Lugt, All rights reserved.
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
// 0.3.0  - Moved the comparable extension to global functions.
//        - Removed the dictionary and data extensions
//        - Added NSNumber extension
// 0.1.0  - Initial release, copied from SwiftfireCore in the version 0.9.17
// =====================================================================================================================


import Foundation


public extension Bool {
    
    
    /// Initializes a bool from '0', '1', 'yes', 'no', 'true' or 'false'. Case insensitive.
    
    public init?(lettersOrDigits: String) {
        if lettersOrDigits == "0" { self = false }
        else if lettersOrDigits == "1" { self = true }
        else if lettersOrDigits.compare("true", options: [.diacriticInsensitive, .caseInsensitive], range: nil, locale: nil) == ComparisonResult.orderedSame { self = true }
        else if lettersOrDigits.compare("false", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else if lettersOrDigits.compare("yes", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = true }
        else if lettersOrDigits.compare("no", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else { return nil }
    }
    
    
    /// Initializes a bool from 'yes', 'no', 'true' or 'false'. Case insensitive.
    
    public init?(letters: String) {
        if letters.compare("true", options: [.diacriticInsensitive, .caseInsensitive], range: nil, locale: nil) == ComparisonResult.orderedSame { self = true }
        else if letters.compare("false", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else if letters.compare("yes", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = true }
        else if letters.compare("no", options: [.diacriticInsensitive, .caseInsensitive]) == ComparisonResult.orderedSame { self = false }
        else { return nil }
    }
}


public extension Array {
    
    /// Removes the given object from the array.
    
    @discardableResult
    public mutating func removeObject<T: AnyObject>(object: T) -> T? {
        for (i, obj) in self.enumerated() {
            if obj as? T === object {
                return self.remove(at: i) as? T
            }
        }
        return nil
    }
}


public extension NSNumber {
    
    
    /// Returns a number, first tries to convert the string to a bool, then an Int and lastly a double.
    
    public static func factory(boolIntDouble: String) -> NSNumber? {
        let str = boolIntDouble.trimmingCharacters(in: CharacterSet.whitespaces)
        if let b = Bool(lettersOrDigits: str) {
            return NSNumber(value: b)
        }
        return factory(intDouble: str)
    }


    /// Returns a number, first tries to convert the string an Int and then a double.

    public static func factory(intDouble: String) -> NSNumber? {
        let str = intDouble.trimmingCharacters(in: CharacterSet.whitespaces)
        if let i = Int(str) {
            if str == i.description {
                return NSNumber(value: i)
            }
        }
        if let d = Double(str) {
            return NSNumber(value: d)
        }
        return nil
    }
}


public extension Date {
    
    /// Returns a DateComponents object that includes the .year, .month, .day of self for the given calendar or (if absent) the current calendar.
    
    public func yearMonthDay(calendar: Calendar? = nil) -> DateComponents {
        let calendar = calendar ?? Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return components
    }
    
    
    /// Returns a DateComponents object that includes the .hour, .minute, .second of self for the given calendar or (if absent) the current calendar.

    public func hourMinuteSecond(calendar: Calendar? = nil) -> DateComponents {
        let calendar = calendar ?? Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)
        return components
    }
    
    
    /// Milli seconds since 1 Jan 1970
    
    public var javaDate: Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    
    /// Seconds since 1 Jan 1970
    
    public var unixTime: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    
    
    /// The javaDate for begin-of-day of self
    
    public var javaDateBeginOfDay: Int64 {
        return Calendar.current.startOfDay(for: self).javaDate
    }
    
    
    /// The javaDate for the beginning of tomorrow.
    
    public var javaDateBeginOfTomorrow: Int64 {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!.javaDateBeginOfDay
    }

    
    /// The javaDate for the beginning of yesterday.
    
    public var javaDateBeginOfYesterday: Int64 {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!.javaDateBeginOfDay
    }

    
    /// The javaDate for the beginning of the week self is in
    
    public var javaDateBeginOfWeek: Int64 {
        return Calendar.current.date(bySetting: .weekday, value: 1, of: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaDate for the beginning of the next week
    
    public var javaDateBeginOfNextWeek: Int64 {
        let aDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: self)!
        return Calendar.current.date(bySetting: .weekday, value: 1, of: aDate)!.javaDateBeginOfDay
    }
    

    /// The javaDate for the beginning of the month self is in
    
    public var javaDateBeginOfMonth: Int64 {
        return Calendar.current.date(bySetting: .day, value: 1, of: self)!.javaDateBeginOfDay
    }
    
    
    /// The javaData for the beginning of next month
    
    public var javaDateBeginOfNextMonth: Int64 {
        let aDate = Calendar.current.date(byAdding: .month, value: 1, to: self)!
        return Calendar.current.date(bySetting: .day, value: 1, of: aDate)!.javaDateBeginOfDay
    }
    
    
    /// Create a new Date object.
    ///
    /// - Parameter value: The number of milli seconds since 1 Jan 1970
    
    public static func fromJavaDate(_ value: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(value / 1000))
    }
    
    
    /// Create a new Date object.
    ///
    /// - Parameter value: The number of seconds since 1 Jan 1970
    
    public static func fromUnixTime(_ value: Int64) -> Date {
        return Date(timeIntervalSince1970: Double(value))
    }
}
