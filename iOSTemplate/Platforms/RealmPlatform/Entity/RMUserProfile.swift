//
//  RMProfile.swift
//  RealmPlatform
//

/*import Domain
import RealmSwift
import Realm

final class RMUserProfile: Object {
  
  @objc dynamic var userId: String = ""
  @objc dynamic var userName: String = ""
  @objc dynamic var firstName: String = ""
  @objc dynamic var lastName: String = ""
  @objc dynamic var email: String = ""
  @objc dynamic var phoneNumber: String = ""
  
  override class func primaryKey() -> String? {
    return "userId"
  }
}

// MARK: - DomainConvertibleType

extension RMUserProfile: DomainConvertibleType {
  
  func asDomain() -> UserProfile {
    
    /// TODOs: TBA
    return UserProfile(userId: userId,
                   userName: userName,
                   firstName: firstName,
                   lastName: lastName,
                   email: email,
                   phoneNumber: phoneNumber)
  }
}

extension UserProfile: RealmRepresentable {
  
  var uid: String {
    return userId ?? ""
  }
  
  func asRealm() -> RMUserProfile {
    
    /// TODOs: TBA
    return RMUserProfile.build { object in
      object.userId = userId ?? ""
      object.userName = userName ?? ""
      object.firstName = firstName ?? ""
      object.lastName = lastName ?? ""
      object.email = email ?? ""
      object.phoneNumber = phoneNumber ?? ""
    }
  }
}*/
