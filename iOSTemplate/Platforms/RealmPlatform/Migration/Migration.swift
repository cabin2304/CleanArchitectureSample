//
//  Migration.swift
//  RealmPlatform
//

/*import RealmSwift

public struct Migration {
  
  static public func migration(schemaVersion: UInt64 = 1) {
    let config = Realm.Configuration(
      // Set the new schema version. This must be greater than the previously used
      // version (if you've never set a schema version before, the version is 0).
      schemaVersion: schemaVersion,
      
      // Set the block which will be called automatically when opening a Realm with
      // a schema version lower than the one set above
      // TODO: TBA
      migrationBlock: { migration, oldSchemaVersion in // migration, oldSchemaVersion in
        /// This version update properties for Activity model
      }
    )
    
    // Update new config to default configuration
    Realm.Configuration.defaultConfiguration = config
    
    /// Perform the migration
    _ = RealmFactory.sharedInstance.realm()
    
  }
}*/
