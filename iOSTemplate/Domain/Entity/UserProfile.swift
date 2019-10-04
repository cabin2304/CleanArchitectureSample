//
//  UserProfile.swift
//  Domain
//

import Foundation

public struct UserProfile: Codable {
  public let userId: String?
  public let userName: String?
  public let firstName: String?
  public let lastName: String?
  public var email: String?
  public var phoneNumber: String?
    
  public var fullName: String {
    return [firstName, lastName].compactMap({ $0 }).joined(separator: " ")
  }
  
  public init(userId: String? = nil,
              userName: String? = nil,
              firstName: String? = nil,
              lastName: String? = nil,
              email: String? = nil,
              phoneNumber: String? = nil) {
    self.userId = userId
    self.userName = userName
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.phoneNumber = phoneNumber
  }
}

extension UserProfile: Equatable {
  
  public static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
    return
      lhs.userId == rhs.userId &&
      lhs.userName == rhs.userName &&
      lhs.firstName == rhs.firstName &&
      lhs.lastName == rhs.lastName &&
      lhs.email == rhs.email &&
      lhs.phoneNumber == rhs.phoneNumber
  }
}
