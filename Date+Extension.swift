//
//  Date+Extension.swift
//  ios-gox
//
//  Created by Willa on 04/05/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension Date {
    
    
    /// Date format to string
    /// - Parameter format: format, the default is dd-MM-yyyy
    /// - Returns: string of Date
    func toString(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    
    /// Date format to string with time
    /// - Parameter format: yyyy-MM-dd HH:mm
    /// - Returns: string of Date
    func dateAndTimetoString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    
    /// Time in 24 hours format
    /// - Returns: string of Date
    func timeIn24HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    
    /// Get the start of the moth by today prespective
    /// - Returns: Date
    func startOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
    
    
    /// Get the end of the moth by today prespective
    /// - Returns: Date
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    
    /// Get the next day date by today prespective
    /// - Returns: next day date
    func nextDate() -> Date {
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: self)
        return nextDate ?? Date()
    }
    
    
    /// Get the previous day date by today prespective
    /// - Returns: previous day date
    func previousDate() -> Date {
        let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: self)
        return previousDate ?? Date()
    }
    
    func addMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
        return endDate ?? Date()
    }
    
    func removeMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: -numberOfMonths, to: self)
        return endDate ?? Date()
    }
    
    func removeYears(numberOfYears: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .year, value: -numberOfYears, to: self)
        return endDate ?? Date()
    }
    
    func getHumanReadableDayString() -> String {
        let weekdays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]
        
        let calendar = Calendar.current.component(.weekday, from: self)
        return weekdays[calendar - 1]
    }
    
    
    
    /// Get the string human readable date. from the given Date by today prespective (distance)
    /// years ago, months ago, days ago, wekks ago, hours ago, minutes ago
    /// - Parameter fromDate: Date you want to calculate
    /// - Returns: human readable date
    func timeSinceDate(fromDate: Date) -> String {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self
        
        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        
        if year >= 2{
            return "\(year) years ago"
        }else if (year >= 1){
            return "1 year ago"
        }else if (month >= 2) {
            return "\(month) months ago"
        }else if (month >= 1) {
            return "1 month ago"
        }else  if (week >= 2) {
            return "\(week) weeks ago"
        } else if (week >= 1){
            return "1 week ago"
        } else if (day >= 2) {
            return "\(day) days ago"
        } else if (day >= 1){
            return "1 day ago"
        } else if (hours >= 2) {
            return "\(hours) hours ago"
        } else if (hours >= 1){
            return "1 hour ago"
        } else if (minutes >= 2) {
            return "\(minutes) minutes ago"
        } else if (minutes >= 1){
            return "1 minute ago"
        } else if (seconds >= 3) {
            return "\(seconds) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    
    
    /// Basically same as Date().timeSinceDate function but return the notificaion section enum
    /// - Parameter fromDate: Date you want to calculate
    /// - Returns: notificaton section enum
    func timeSinceDateForNotification(fromDate: Date) -> NotificationSection {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self
        
        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        
        if year >= 2{
            return .thisYear
        }else if (year >= 1){
            return .thisYear
        }else if (month >= 2) {
            return .thisYear
        }else if (month >= 1) {
            return .lastMonth
        }else if (week >= 2) {
            return .lastMonth
        } else if (week >= 1){
            return .thisWeek
        } else if (day >= 2) {
            return .thisWeek
        } else if (day >= 1){
            return .yesterday
        } else if (hours >= 2) {
            return .today
        } else if (hours >= 1){
            return .today
        } else if (minutes >= 2) {
            return .today
        } else if (minutes >= 1){
            return .today
        } else if (seconds >= 3) {
            return .today
        } else {
            return .today
        }
        
    }
}
