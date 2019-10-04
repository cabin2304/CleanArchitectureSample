//
//  Utility.swift
//  ServiceKit
//

import Foundation
import CoreLocation
import StoreKit

public struct Utility {

  public static func getUniqueDeviceID() -> String {
    return UIDevice.current.identifierForVendor?.uuidString ?? ""
  }

  /// MARK: - Save and retrieve values by keys from User storage
  public static func save(datas: [(Any?, String)]) {
    let userDefault = UserDefaults.standard
    datas.forEach { (value, key) in
      userDefault.set(value, forKey: key)
    }
  }

  public static func retrieve(key: String) -> Any? {
    return UserDefaults.standard.value(forKey: key)
  }

  /// Validate given object in Any type that can be converted to JSON data
  /// If yes, start serializing it to data to be able to work with Decoder mechanism in particularly
  /// otherwise, return nil and break the function
  ///
  /// - Parameter jsonObject: given object
  /// - Returns: converted object in Data type
  public static func serializeJSON(_ jsonObject: Any) -> Data? {
    guard JSONSerialization.isValidJSONObject(jsonObject) else { return nil }
    do {
      return try JSONSerialization.data(withJSONObject: jsonObject)
    } catch {
      return nil
    }
  }
  
  /// Serializing a given data to an optional object in JSON type
  ///
  /// - Parameter data: given data
  /// - Returns: optional object in JSON type
  public static func serializeData<T>(_ data: Data) -> T? {
    do {
      return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? T
    } catch {
      return nil
    }
  }

  /// Decode json to model in given type
  ///
  /// - Parameter json: target json
  /// - Returns: optional model object
  public static func decode<T: Decodable>(json: Any) -> T? {
    guard JSONSerialization.isValidJSONObject(json) else { return nil }
    guard let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else { return nil }
    return try? JSONDecoder().decode(T.self, from: data)
  }

  /// Encoding an encodable object to JSON
  ///
  /// - Parameter obj: given object
  /// - Returns: optional json
  public static func encode<T: Encodable>(_ obj: T) throws -> [String: Any] {
    do {
      let encodedData = try JSONEncoder().encode(obj)
      guard let json: [String: Any] = Utility.serializeData(encodedData) else {
        throw NSError(domain: "Cannot serialize the data to json", code: 101, userInfo: nil)
      }
      return json
    } catch {
      throw error
    }
  }

  /// Format number to text converting in grammar
  ///
  /// - Parameters:
  ///   - number: number
  ///   - single: suffix for single
  ///   - plural: suffix for plural
  /// - Returns: formatted text
  public static func grammarNumber(_ number: Int, _ single: String, _ plural: String) -> String {
    return "\(Utility.formatCounter(number)) " + (number != 1 ? plural : single)
  }

  /// Correct number to get rid of nagative value
  ///
  /// - Parameter val: inputting value
  /// - Returns: corrected value
  public static func absNumber(val: Int) -> Int {
    return val < 0 ? 0: val
  }

  /// Convert counter number to string in specific format:
  /// If counter > 999, convert to K unit
  ///
  /// - Parameter counter: counter number in Int unit
  /// - Returns: formatted string
  public static func formatCounter(_ counter: Int, unit: String = "K") -> String {
    if counter >= 1000 {
      let mod = Int((counter % 1000) / 100)
      let decimal = Int(counter / 1000)
      let suffix = mod == 0 ? "": ".\(mod)"
      return "\(decimal)" + suffix + unit
    }
    return "\(counter)"
  }

  /// The concept of optimizing query objects from a large list is caching index of object in a dictionary with format: [String: [Int]],
  /// key is id of object, value is an array of object index in the list.
  /// Whenever we want to retrive all objects that have the same `key` from the list, we just need to get cached indexes from dictionary by `key` and then getting objects in the list by index
  /// This solution will just take the complexity in linear time (that's O(n))
  ///
  /// - Parameters:
  ///   - dict: index cached dictionary
  ///   - key: query key
  ///   - list: list of objects
  /// - Returns: array of tuple data including index and object
  public static func elementsIn<T>(dict: [String: [Int]], by key: Int, from list: [T]) -> [(Int, T)] {
    if let val = dict["\(key)"] {
      return val.compactMap{ list.indices ~= $0 ? ($0, list[$0]) : nil }
    }
    return []
  }

  /// Detect a list contains an element by its entire content or just a prefix
  ///
  /// - Parameters:
  ///   - list: target list
  ///   - range: current range of inputting text
  ///   - text: need-to-check element
  /// - Returns: tuple of exists flag and length of text
  public static func contains(list: Set<String>, text: String) -> (Bool, Int) {
    let item = list.lazy.filter{ text.hasPrefix($0) }
    return list.contains(text) ? (true, text.count) : (item.first.notNil, item.first?.count ?? text.count)
  }

  /// Removing an element of array that is value of specific key in dictionary
  ///
  /// - Parameters:
  ///   - key: query key
  ///   - value: removed value
  ///   - dict: caching dictionary
  public static func removeValues<V: Equatable, K: Hashable>(_ value: V, by key: K, from dict: inout [K: [V]]) {
    if let values = dict[key] {
      let filteredItems = values.filter{ $0 != value }
      dict[key] = filteredItems.isEmpty ? nil: filteredItems
    }
  }
  
  /// Present sharing activity from a specified viewcontroller
  ///
  /// - Parameters:
  ///   - items: shared items
  ///   - vc: target viewcontroller
  public static func presentActivity(items: [Any], from vc: UIViewController) {
    let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
    activity.excludedActivityTypes = [.assignToContact, .print, .copyToPasteboard, .addToReadingList]
    vc.present(activity, animated: true)
  }
  
  public static func degrees(start: CLLocationCoordinate2D, end: CLLocationCoordinate2D) -> CGFloat {
    let slat = Converter.degToRad(deg: start.latitude)
    let slon = Converter.degToRad(deg: start.longitude)
    
    let elat = Converter.degToRad(deg: end.latitude)
    let elon = Converter.degToRad(deg: end.longitude)
    
    let y = sin(elon - slon) * cos(elat)
    let x = cos(slat) * sin(elat) - sin(slat) * cos(elat) * cos(elon - slon)
    let radians = atan2(y, x)
    
    return Converter.radToDeg(rad: Double(radians))
  }
  
  public static func isAddress(_ adr: String?) -> CLLocation? {
    guard let adr = adr else { return nil }
    let coms = adr.components(separatedBy: ",")
    /// swiftlint:disable force_unwrapping
    if coms.count == 2, let f = coms.first?.trim(), let lat = Double(f),
      let l = coms.last?.trim(), let long = Double(l) {
      return CLLocation(latitude: lat, longitude: long)
    }
    return nil
  }
}

