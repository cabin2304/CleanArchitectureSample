//
//  Repository.swift
//  RealmPlatform
//

/*import RealmSwift
import RxSwift
import SwiftyBeaver
import Realm

// Making SwiftyBeaver as a helper property
let logger = SwiftyBeaver.self

protocol AbstractRepository {
  
  associatedtype T
  func queryCurrentObject() -> T?
  func queryAll() -> [T]
  func queryObjectFiltering(condition: String) -> T?
  func addObjects(entities: [T], update: Bool)
  func addObject(entity: T)
  func updateObject(entity: T)
  func deleteObject(entity: T)
  func deleteObjectFiltering(condition: String)
  func cleanAll()
  func removeAll()
  func queryObjects(condition: String) -> [T]
}

protocol RepositoryObservable {
  
  associatedtype T
  func queryAll() -> Observable<[T]>
  func save(entity: T) -> Observable<Void>
  func delete(entity: T) -> Observable<Void>
}

final class Repository<T:RealmRepresentable>: AbstractRepository where T == T.RealmType.DomainType, T.RealmType: Object {
  
  private let scheduler: RunLoopThreadScheduler
  private var realm = RealmFactory.sharedInstance.realm()
  //  {
  //    return RealmFactory.sharedInstance.realm()
  //  }
  
  init() {
    let name = "com.iOSTemplate.RealmPlatform.Repository"
    self.scheduler = RunLoopThreadScheduler(threadName: name)
    logger.debug("File 📁 url: \(RLMRealmPathForFile("default.realm")) \(T.RealmType.className())")
  }
  
  // MARK: - Abstract Repository
  
  func queryCurrentObject() -> T? {
    let realm = self.realm
    return realm.objects(T.RealmType.self).first?.asDomain()
  }
  
  func queryAll() -> [T] {
    let realm = self.realm
    //    var array = [T]()
    return realm.objects(T.RealmType.self).map{$0.asDomain()}
    //    for i in 0..<result.count {
    //      array.append(result[i].asDomain())
    //    }
    //    return array
  }
  
  func queryObjectFiltering(condition: String) -> T? {
    let realm = self.realm
    guard let object = realm.objects(T.RealmType.self).filter(condition).first else { return nil}
    
    return object.asDomain()
  }
  
  func queryObjects(condition: String) -> [T] {
    let realm = self.realm
    let objects = realm.objects(T.RealmType.self).filter(condition)
    return objects.map{$0.asDomain()}
  }
  
  func cleanAll() {
    /// Delete all objects from the realm
    let realm = self.realm
    do {
      try realm.write {
        realm.deleteAll()
      }
    } catch let error {
      logger.error("Got error when access to realm \(error)")
    }
  }
  
  func addObjects(entities: [T], update: Bool = true) {
    guard entities.first != nil else {
      return
    }
    /// Add entities to the realm
    let realm = self.realm
    entities.forEach { object in
      let object = object.asRealm()
      realm.writeAsync(realm: realm, obj: object) { (object) in
        guard let object = object else { return }
        realm.add(object, update: true)
      }
    }
  }
  
  func addObject(entity: T) {
    /// Add new entity to the realm
    
    let realm = self.realm
    let object = entity.asRealm()
    
    realm.writeAsync(realm: realm, obj: object) { (object) in
      guard let object = object else { return }
      realm.add(object)
    }
  }
  
  func updateObject(entity: T) {
    /// Update a entity to the realm
    
    let realm = self.realm
    let object = entity.asRealm()
    
    realm.writeAsync(realm: realm, obj: object) { (object) in
      guard let object = object else { return }
      realm.add(object, update: true)
    }
  }
  
  func deleteObject(entity: T) {
    /// Delete a entity to the realm
    let realm = self.realm
    let object = entity.asRealm()
    
    realm.writeAsync(realm: realm, obj: object) { (object) in
      guard let object = object else { return }
      realm.delete(object)
    }
  }
  
  func deleteObjectFiltering(condition: String) {
    /// Delete a entity to the realm based in condition
    let realm = self.realm
    
    guard let object = realm.objects(T.RealmType.self).filter(condition).first else { return }
    
    realm.writeAsync(realm: realm, obj: object) { (object) in
      guard let object = object else { return }
      realm.delete(object)
    }
  }
  
  func removeAll() {
    let realm = self.realm
    let objects = realm.objects(T.RealmType.self)
    realm.writeAsync(realm: realm, obj: objects) { (objects) in
      guard let objects = objects else { return }
      realm.delete(objects)
    }
  }
}
*/
