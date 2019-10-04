//
//  SecureKey.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import CryptoSwift
import ServiceKit

/*
 Where controls all actions related to save and retrieve value from User Default
 All strings value will be encrypted/decrypted before saving/retrieving from UD
 Other types will be save/retrieve directly
 */

public protocol UD {
  
  associatedtype T
  var rawValue: String {get}
}

public extension UD {
  
  // MARK: - Getter and Setter
  var value: T? {
    let val = UserDefaults.standard.value(forKey: key) as? T
    return decrypt(val: val)
  }
  
  func set(ud: UserDefaults? = UserDefaults.standard, _ val: T?) {
    let value = encrypt(val)
    ud?.set(value, forKey: key)
  }
  
  func instance(_ name: String) -> UserDefaults? {
    return UserDefaults(suiteName: name)
  }
  
  func archive<E: Codable>(val: E) {
    let archiver = NSKeyedArchiver.init(requiringSecureCoding: true)
    do {
      try archiver.encodeEncodable(val, forKey: NSKeyedArchiveRootObjectKey)
      UserDefaults.standard.set(archiver.encodedData, forKey: key)
    } catch let err {
      Service.log.error("Archive: \(err)")
    }
  }
  
  func unarchive<E: Codable>() -> E? {
    if let data = UserDefaults.standard.value(forKey: key) as? Data {
      do {
        let val = try NSKeyedUnarchiver(forReadingWith: data).decodeTopLevelDecodable(E.self, forKey: NSKeyedArchiveRootObjectKey)
        return val.map({ $0 })
      } catch let err {
        Service.log.error("Unarchive: \(err)")
      }
    }
    return nil
  }
  
  var bool: Bool {
    return UserDefaults.standard.bool(forKey: key)
  }
  
  // MARK: - Private handlers
  private var key: String {
    return rawValue
  }
  
  private var secureKey: String {
    return key.count > 16 ? String(key.prefix(16)) : key + String(repeating: "k", count: 16 - key.count)
  }
  
  // MARK: - Encrypt and Decrypt String using AES Method
  private func encrypt(_ val: T?) -> T? {
    /// Only encrypt the param that is in String type
    guard let value = val as? String, !value.isEmpty else { return val }
    do {
      /// Initialize AES with iv and securekey in 16 bytes
      let iv = AES.randomIV(AES.blockSize)
      let aes = try AES(key: secureKey.md5().bytes, blockMode: CBC(iv: iv))
      /// Start encrypting the inputting value
      let encrypted = try aes.encrypt(value.bytes)
      /// Shift iv key to the result to use for decrypt later
      let encryptedK = Data(encrypted)
      var encryptedKIV = Data(iv)
      encryptedKIV.append(encryptedK)
      /// Encode based64 data to end string
      return encryptedKIV.base64EncodedString() as? T
    } catch let err {
      Service.log.error(err)
      return val
    }
  }
  
  private func decrypt(val: T?) -> T? {
    /// Ignore if the param is not a string
    guard let value = val as? String, !value.isEmpty else { return val }
    do {
      /// Ignore if its not a base64Encoded
      guard let data = Data(base64Encoded: value) else { return val }
      let count = [UInt8](data).count
      /// Assumption based on encrypt method, the data size must be always greater than iv key size
      guard count > AES.blockSize else { return val }
      /// Get iv key part from the decoded data
      let iv = Array([UInt8](data)[0 ..< AES.blockSize])
      /// Get target data
      let bytes = Array([UInt8](data)[AES.blockSize ..< count])
      /// Decrypt data by AES method
      let aes = try AES(key: secureKey.md5().bytes, blockMode: CBC(iv: iv))
      let decrypted = try aes.decrypt(bytes)
      return String(bytes: decrypted, encoding: .utf8) as? T
    } catch let err {
      Service.log.error(err)
      return val
    }
  }
}

/// for dealling with UserDefault
public enum SecureKey<T>: String, UD {
  
  case example = "EXAMPLE"
  // MARK: - Usecases
  enum User: String, UD, CaseIterable {
    
    case email = "USER_EMAIL"
    case confirmed = "USER_CONFIRMED"
    case userId = "USER_ID"
    case token = "TOKEN"
    case password = "PASSWORD"
    
    var num: Int {
      return Int(self.value as? String ?? "0") ?? 0
    }
    
    static func clean() {
      User.allCases.forEach({ $0.set(nil) })
    }
  }
}
