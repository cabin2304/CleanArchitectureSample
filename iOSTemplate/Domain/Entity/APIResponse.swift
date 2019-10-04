//
//  APIResponse.swift
//  Domain
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import ServiceKit

/// Network response customization
///
/// - next: if all conditions are met and response object is already
/// - error: if there has an error
/// - completed: if there has no error as well as no value
public enum APIResponse<T>: Equatable {
  
  public static func == (lhs: APIResponse<T>, rhs: APIResponse<T>) -> Bool {
    switch lhs {
    case .next: return rhs.isNext
    case .error: return rhs.isError
    case .completed: return !rhs.isError && !rhs.isNext
    }
  }
  
  case next(T)
  case error(APIError?)
  case completed
  
  public var isNext: Bool {
    if case .next(_) = self {
      return true
    }
    return false
  }
  
  var isError: Bool {
    if case .error(_) = self {
      return true
    }
    return false
  }
}

public struct APIError: Decodable {
  
  public var code: Int = 400
  public var message: String?
  public var title: String?
  
  public init(code: Int, message: String? = nil, title: String? = nil) {
    self.code = code
    self.message = message
    self.title = title
  }
  
  public init(_ message: String? = nil) {
    self.code = 400
    self.message = message
    self.title = nil
  }
  
  enum CodingKeys: String, CodingKey {
    case code, title
    case message = "error"
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    code    <~ (values, .code)
    title   <~ (values, .title)
    message <~ (values, .message)
  }
}

