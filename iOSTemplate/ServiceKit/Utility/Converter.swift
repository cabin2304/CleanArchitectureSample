//
//  Converter.swift
//  ServiceKit
//

import UIKit
import SwiftDate

public struct Converter {
  
  public static func mileToMetres(val: Float) -> Float {
    return val * 1000 / 0.621371
  }
  
  public static func meterToMile(val: Float) -> Float {
    return val * 0.621371 / 1000
  }
  
  public static func meterToKm(_ val: Float) -> Float {
    return val / 1000
  }
  
  public static func minToHour(val: Float) -> Float {
    return val/60
  }
  
  public static func degToRad(deg: Double) -> CGFloat {
    return CGFloat(deg * .pi / 180)
  }
  
  public static func radToDeg(rad: Double) -> CGFloat {
    return CGFloat(rad * 180 / .pi)
  }
  
  public static func truncatedFloat(_ num: Float, truncate: Int = 2) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = truncate
    let val = formatter.string(from: NSNumber(value: num)) ?? ""
    let comps = val.components(separatedBy: ".")
    if comps.count == 2, comps[0].isEmpty {
      return "0." + comps[1]
    }
    return val
  }
  
  public static func dateShortToFull(_ date: String) -> String {
    let temp = date.toDate(DateFormat.sortDate.format, region: .local)?.date
    if temp.notNil {
      return date + "T00:00:00Z"
    }
    return date
  }
}
