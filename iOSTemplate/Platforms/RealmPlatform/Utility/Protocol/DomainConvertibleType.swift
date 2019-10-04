//
//  DomainConvertibleType.swift
//  RealmPlatform
//

import Foundation

protocol DomainConvertibleType {
  
  associatedtype DomainType
  
  func asDomain() -> DomainType
}
