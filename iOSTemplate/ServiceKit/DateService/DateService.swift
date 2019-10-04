//
//  DateService.swift
//  ServiceKit
//

import SwiftDate

public extension String {
  
  private func date(format: DateFormat) throws -> Date {
    if let dateInRegion = DateInRegion(self, format: format.format, region: .local) {
      return dateInRegion.date
    }
    return Date.today
  }
  func toTime() -> Date {
    if let date = try? self.date(format: .time) {
      return date
    }
    return Date.today
  }
  
  func toDate(format: DateFormat = .standard) -> Date {
    if let date = try? self.date(format: format) {
      return date
    }
    return Date.today
  }
  
  func toDateOnly() -> String {
    if let date = try? self.date(format: .dateOnly).toDateOnly() {
      return date
    }
    return self
  }
  
  func toUTC() -> String {
    if let dateInRegion = DateInRegion(self, format: DateFormat.standard.format, region: .local) {
      return dateInRegion.convertTo(region: .UTC).toString(.custom(DateFormat.standard.format))
    }
    return self
  }
  
  func toDateFromUTC(format: DateFormat = .standard) -> Date {
    if let date = DateInRegion(self, format: format.format, region: .UTC) {
      return date.convertTo(region: .local).date
    } else if let date = DateInRegion(self, format: format.format.replacingOccurrences(of: "HH", with: "hh"), region: .UTC) {
      return date.convertTo(region: .local).date
    }
    return Date.today
  }
  
  func toDateString(format: DateFormat = .standard) -> String {
    if let date = try? self.date(format: format).toDateString() {
      return date
    }
    return self
  }
  
  func toShortDate() -> Date {
    return toDate(format: .sortDate)
  }
  
  func toFormalUTC() -> Date {
    return toDateFromUTC(format: .formal)
  }
  
  func diff() -> Int? {
    let today = Date.today
    let date = self.toDateFromUTC()
    return (today - date).in(.minute)
  }
  
  func combineTime(end: String) -> String {
    let date = self.toDateFromUTC()
    let endStr = end.isEmpty ? "": " - " + end.toDateFromUTC().toTimeString()
    let time = date.toTimeString() + endStr
    return date.toDateOnly() + " " + time
  }
  
  func comparasion(_ f: (Date, Date) -> Bool, target: String) -> Bool {
    return f(self.toDateFromUTC(), target.toDateFromUTC())
  }
  
  func isTomorrow(end: String) -> String {
    let verifiedDate = end.toDate()
    let current = self.toDate()
    if !current.isSameDay(from: verifiedDate) {
      return end
    }
    if verifiedDate < self.toDate() {
      return (verifiedDate + 1.days).toDateString()
    }
    return end
  }
  
  var isExpired: Bool {
    if self.isEmpty {
      return false
    }
    return self.toDateFromUTC().isBeforeDate(Date.today, granularity: .day)
  }
}

// MARK: - Date
public extension Date {
  
  func roundUp() -> Date {
    var date = DateInRegion(self)
    if let minute = date.dateComponents.minute, minute > 0 {
      // swiftlint:disable shorthand_operator
      date = date + (60 - minute).minutes
    }
    return date.date
  }
  
  func dateInRegion() -> DateInRegion {
    return DateInRegion(self, region: .local)
  }
  
  private func dateInRegion(format: String) -> DateInRegion {
    return DateInRegion(self, region: .local)
  }
  
  private func format(format: DateFormat) -> String {
    return dateInRegion().toString(.custom(format.format))
  }
  
  func toTimeString() -> String {
    return self.format(format: .time)
  }
  
  func toDateString() -> String {
    return self.format(format: .standard)
  }
  
  func toDateInYearString() -> String {
    return self.format(format: .dateInYear)
  }
  
  func toShortDateString() -> String {
    return self.format(format: .sortDate)
  }
  
  func toTimeStringExt() -> String {
    return self.format(format: .time).lowercased().replacingOccurrences(of: " ", with: "")
  }
  
  func toDateOnly() -> String {
    return self.format(format: .dateOnly)
  }
  
  func weekdayMonthFormat() -> String {
    return self.format(format: .weekdayInMonth)
  }
  
  func shortMonthDayFormat() -> String {
    return self.format(format: .shortMonthDayOnly)
  }
  
  func toOnlyMonth() -> String {
    return self.format(format: .onlyMonth)
  }
  
  func monthFormat() -> String {
    return self.format(format: .dateInMonth)
  }
  
  func fullDate() -> String {
    return self.format(format: .fullDate)
  }
  
  func weekday() -> String {
    return self.format(format: .weekday)
  }
  
  static var today: Date {
    return DateInRegion().date
  }
  
  static func monthName(_ month: Int) -> String {
    return Date(components: DateComponents(year: Date.today.year, month: month, day: 15), region: .current)?
      .toFormat(DateFormat.onlyMonth.format).capitalized ?? ""
  }
  
  func dateUTC() -> String {
    let dateInRegion = DateInRegion(self, region: .local)
    return dateInRegion.convertTo(region: .UTC).toString(.custom(DateFormat.sortDate.format))
  }
  
  var tomorrow: Date {
    return Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
  }
  
  /// Check the interval of self and inputting date is less than a specific detail second(10) or not
  func lessThanDelta(_ delta: Int, date: Date) -> Bool {
    guard let interval = (self - date).in(.second) else { return false }
    return interval < delta
  }
  
  // Return full name day of week and an ordinal day
  // Ex: Monday 1st
  func fullNameDayAndOrdinalDay() -> String {
    return self.dateInRegion().weekdayName(.default) + " \(dateInRegion().ordinalDay)"
  }
  
  // Return short date format
  // Ex: 6:10am, Yesterday, Monday, June 1
  func toShortDateFormat() -> String {
    if self.isToday {     return self.toTimeStringExt() }
    if self.isYesterday { return Terms.yesterday.desc }
    
    let today = Date.today
    let check = self.weekday >= firstDayOfWeek && self.weekday <= lastDayOfWeek && today.weekday >= firstDayOfWeek && today.weekday <= lastDayOfWeek
    if check { return weekdayName(.default) }
    return shortMonthDayFormat()
  }
  
  /// Returns true if they're same minute
  func isSameMinute(from date: Date?) -> Bool {
    if let date = date {
      return Calendar.current.compare(date, to: self, toGranularity: .minute) == .orderedSame
    }
    return false
  }
  
  func isSameDay(from date: Date?) -> Bool {
    if let date = date {
      return Calendar.current.compare(date, to: self, toGranularity: .day) == .orderedSame
    }
    return false
  }
  
  func equal(date: Date) -> Bool {
    return self.dateInRegion() == date.dateInRegion()
  }
  
  // // Ex: Today, Yesterday, Monday, June 1
  func toDateWithSortFormat() -> String {
    if isToday {     return Terms.today.desc }
    if isYesterday { return Terms.yesterday.desc }
    
    let today = Date.today.weekday
    let check = self.weekday >= firstDayOfWeek && self.weekday <= lastDayOfWeek && today >= firstDayOfWeek && today <= lastDayOfWeek
    let result = self.toDateOnly()
    if check {       return weekdayName(.default)  }
    return result
  }
  
  func timeStampUTC() -> TimeInterval {
    return DateInRegion(self, region: .UTC).date.timeIntervalSince1970
  }
  
  func subCurrentDay() -> Int {
    let result = ((Date.today - self).in(.day)) ?? 0
    return result > 0 ? result : 0
  }
}

