//
//  AuthUseCase.swift
//  RealmPlatform
//

/*import Foundation
import Domain
//import Realm
//import RealmSwift
import RxSwift

final class AuthUseCase {
  
  // Define properties here
  // TODO: TBA
  
  // Private helper method
  fileprivate func clearUserData() {
    /// Clear all current user profile data
    let repository = Repository<UserProfile>()
    if repository.queryCurrentObject() != nil {
      repository.cleanAll()
    }
  }
}

// MARK: - Authentication use case protocol
extension AuthUseCase: AuthUseCaseProtocol {
  
  func setContext(_ authContext: AuthContext?) {
    guard authContext != nil else {
      // TODO: Please reset realm data
      return
    }
  }
  
  func login(_ authContext: AuthContext) -> Observable<Domain.Response<UserProfile>> {
    let repository = Repository<UserProfile>()
    if let profile = repository.queryCurrentObject() {
      return Observable.just(Response.next(profile))
    }
    return Observable.just(Response.completed)
  }
}*/
