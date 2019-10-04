//
//  DateFormat.swift
//  ServiceKit
//

import Foundation

public typealias DateFormatType = (DateFormat, String)

public enum DateFormat: String {
  case dateInYear = "M/d/yyyy"
  case dateInMonth = "MMM d, h:mm a"
  case weekday = "EEEE, h:mm a"
  case time = "h:mm a"
  case standard = "yyyy-MM-dd HH:mm:ss"
  case sortDate = "yyyy-MM-dd"
  case dateOnly = "MMMM d"
  case shortMonthDayOnly = "MMM d"
  case weekdayInMonth = "EEE, MMM d"
  case formal = "yyyy-MM-dd'T'HH:mm:ss'Z'"
  case fullDate = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
  case fullNameDayOfWeek = "EEEE"
  case onlyMonth = "MMMM"

  public var format: String {
    return rawValue
  }

  public static func dates(date: Date) -> [DateFormatType] {
    return [(.dateInYear, date.toDateInYearString()), (.dateInMonth, date.monthFormat()), (.weekday, date.weekday()), (.time, date.toTimeString())]
  }
  
  public var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = self.format
    return formatter
  }
}

public enum Terms: String {
  case yesterday = "Yesterday"
  case justNow = "Just now"
  case tomorrow = "Tomorrow"
  case today = "Today"
  public var desc: String {
    return rawValue
  }
}

