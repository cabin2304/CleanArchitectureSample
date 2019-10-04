//
//  BaseMapping.swift
//  NetworkPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import Domain
import ServiceKit

/// Enumeration that consists of hardcode key for mapping
private enum MappingKeys: String {
  
  case meta
  case objects
}

protocol Mapping {
  
  var jsonDecoder: JSONDecoder {get}
}

extension Mapping {
  
  /// Just convert from Reponse to APIResponse for the consistency
  func converter(res: Response) -> APIResponse<JSON> {
    switch res {
    case .success(let json): return .next(json as? JSON ?? [:])
    case .error(let err):    return .error(err)
    }
  }

  /// Mapping from JSON to APIResponse that its next case contains a decodable object
  ///
  /// - Returns: a Object Wrapper
  func mapJSON<T: Decodable>(_ json: Any) -> T? {
    guard let data = Utility.serializeJSON(json) else { return nil }
    do {
      let obj = try self.jsonDecoder.decode(T.self, from: data)
      return obj
    } catch let err {
      Service.log.debug("Map JSON Error: \(err)")
      return nil
    }
  }

  /// Mapping Response to APIResponse that its next statement just contains an object only by key or initial object
  ///
  /// - Returns: functional that converts Response and an optional key to APIResponse
  func map<T: Decodable>(output: ((Any) -> Void)? = nil) -> (String?, Response) -> APIResponse<T> {
    return { key, res in
      switch res {
      case .success(let jsonObject):
        var any = jsonObject
        /// Getting json by a specificed key before mapping instead of given object if needed
        if let key = key, let jsonObj = jsonObject as? JSON, let json = jsonObj[key] {
          any = json
        }
        /// Send out json data for extended handlers
        output?(jsonObject)
        /// Start converting json object to data in order to be able to work with Decoder mechanism
        guard let obj: T = self.mapJSON(any) else { return .completed }
        return .next(obj)
      case .error(let err):
        return .error(err)
      }
    }
  }

  /// Mapping Response to APIResponse that its next statement will contains a list of objects
  ///
  /// - Parameter mappers: list of keys
  /// - Returns: functional that converts Response to APIResponse
  func map<T: Decodable>(mappers: [String]) -> (String?, Response) -> APIResponse<[T]> {
    return { key, res in
      switch res {
      case .success(let jsonObject):
        var any = jsonObject as? JSON
        /// Getting json by a specificed key before mapping instead of given object if needed
        if let key = key, let jsonObj = jsonObject as? JSON, let json = jsonObj[key] as? JSON {
          any = json
        }
        /// Serializing json to a list of objects with various keys for respective objects
        let objs: [T] = mappers.compactMap({ key in
          /// Start converting json object to data in order to be able to work with Decoder mechanism
          guard let json = any?[key], let obj: T = self.mapJSON(json) else { return nil }
          return obj
        })
        return .next(objs)
      case .error(let err): return .error(err)
      }
    }
  }

  /// Mapping Response to APIResponse based on given mapper closure and its return
  ///
  /// - Parameter mapper: outside mapper closure
  /// - Returns: functional that converts Response to APIResponse
  func map<T>(mapper: @escaping (JSON) -> T?) -> (Response) -> APIResponse<T> {
    return { res in
      switch res {
      case .success(let json):
        /// Start mapping outside and waiting for return to determine results
        guard let json = json as? JSON, let obj = mapper(json) else { return .completed }
        return .next(obj)
      case .error(let err): return .error(err)
      }
    }
  }

  /// Mapping without serializing to specific model or object,
  /// it means that the function just check response status and then converting to APIResponse
  ///
  /// - Returns: functional that converts Response to APIResponse in boolean
  func map() -> (Response) -> APIResponse<Bool> {
    return { res in
      switch res {
      case .success:        return .next(true)
      case .error(let err): return .error(err)
      }
    }
  }

  /// Mapping Response to APIResponse that its next statement will contains an array of objects along with other info
  ///
  /// - Parameters:
  ///   - filter: giving a filter closure as a paremeter to filter mapped list for doing something
  ///   - extra: user might get some extra info from meta and given json insides this callback
  /// - Returns: functional that converts Response and offset value to APIResponse
  func mapArray<T: Decodable>(filter: ((T) -> Bool)? = nil, extra: ((Meta, JSON) -> Void)? = nil) -> (Int, Response) -> APIResponse<([T], Bool, Int)> {
    return { offset, res in
      switch res {
      case .success(let jsonObject):
        guard let jsonObj = jsonObject as? JSON, let metaJSON = jsonObj[MappingKeys.meta.rawValue], let objectsJSON = jsonObj[MappingKeys.objects.rawValue] else {
          return .completed
        }
        /// Default response json that must consist of 2 dicts are `meta` and `objects`
        /// A `completed` signal will go out and break the mapping if given json doesn't meet the above condition
        guard let meta: Meta = self.mapJSON(metaJSON) else { return .completed }
        guard let objs: [T] = self.mapJSON(objectsJSON) else { return .completed }
        /// For some reasons, the responsed objects need to be filtered before counting accurately
        var counter = objs.count
        if let filter = filter {
          counter = objs.filter{ filter($0) }.count
        }
        /// Extract extra info from inputting json if needed
        if let extra = extra {
          extra(meta, jsonObj)
        }
        /// No matter how many extra info is, default values in next statement should always include 3 durable ones,
        /// namely in objects list, hasmore and total
        return .next((objs, offset + counter < meta.totalCount, meta.totalCount))
      case .error(let err):
        return .error(err)
      }
    }
  }
}
