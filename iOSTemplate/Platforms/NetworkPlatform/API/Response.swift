//
//  Response.swift
//  Domain
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Domain

internal enum Response {

  /// Request is success
  case success(Any)

  /// Response has error consists of Code, Message, Title
  case error(APIError?)

//  case redirect(String)
  /// Initialize NetworkStatus based on response's statusCode
  ///
  /// - Parameter statusCode: response's status code
  init(code: Int, data: Data) {
    switch code {
    case 200..<300:
      do {
        let obj = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        self = .success(obj)
      } catch let err {
        self = .error(APIError(code: 403, message: err.localizedDescription, title: nil))
      }
    case 401: self = .error(APIError(code: code))
    default:
      self = .error(try? JSONDecoder().decode(APIError.self, from: data))
    }
  }
  
  init() {
    self = .error(nil)
  }
}

