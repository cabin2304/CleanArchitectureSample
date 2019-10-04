//
//  Network.swift
//  Domain
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Alamofire
import RxAlamofire
import RxSwift
import ServiceKit
import Domain

public protocol Endpoint {
  
  var path: String {get}
  var parameters: JSON? {get}
  var encoding: ParameterEncoding {get}
}

public struct Network<T: Decodable> {
  
  private let baseURL: String
  private let sessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    configuration.timeoutIntervalForRequest = 60
    configuration.timeoutIntervalForResource = 60
    return SessionManager(configuration: configuration)
  }()
  
  init(baseURL: String) {
    self.baseURL = baseURL
  }
  
  private func absolutePath(_ endpoint: Endpoint) -> String {
    return "\(baseURL)\(endpoint.path)"
  }
  
  private func headers(_ contentType: String = "application/json") -> [String: String]? {
    let headers = !contentType.isEmpty ? ["Content-Type": contentType] : [String: String]()
    return headers.isEmpty ? nil : headers
  }

  private func enableRedirect() {
    sessionManager.delegate.taskWillPerformHTTPRedirection = { session, task, response, request in
      return request
    }
  }
  
  private func irequest(_ method: HTTPMethod, endpoint: Endpoint) -> Observable<Response> {
    /// Always Tie locale language and region to the params list before request takes place
    return sessionManager.rx
      .responseData(method, absolutePath(endpoint),
                    parameters: endpoint.parameters,
                    encoding: endpoint.encoding, headers: headers())
      .map({ Response(code: $0.0.statusCode, data: $0.1) })
      .catchErrorJustReturn(Response.error(nil))
  }
  
  func request(endpoint: Endpoint, method: HTTPMethod = .post, completion: ((Response) -> Void)? = nil) {
    /// Always Tie locale language and region to the params list before request takes place
    sessionManager.request(absolutePath(endpoint), method: method,
                           parameters: endpoint.parameters,
                           encoding: endpoint.encoding, headers: headers())
      .response { (res) in
        if let response = res.response {
          completion?(Response(code: response.statusCode, data: res.data ?? Data()))
        } else {
          completion?(Response(code: res.response?.statusCode ?? 400, data: res.data ?? Data()))
        }
    }
  }
  
  func get(endpoint: Endpoint) -> Observable<Response> {
    return irequest(.get, endpoint: endpoint)
  }
  
  func post(endpoint: Endpoint) -> Observable<Response> {
    return irequest(.post, endpoint: endpoint)
  }
  
  func update(endpoint: Endpoint) -> Observable<Response> {
    return irequest(.put, endpoint: endpoint)
  }
  
  func delete(endpoint: Endpoint) -> Observable<Response> {
    return irequest(.delete, endpoint: endpoint)
  }
  
  /// A free request with no required things
  public static func freeReq(url: String, method: HTTPMethod = .post, params: [String: Any]? = nil, headers: [String : String]? = nil, completion: ((Int, Data?) -> Void)? = nil) {
    Alamofire.request(url, method: method, parameters: params, headers: headers)
      .responseData { (res) in
        completion?(res.response?.statusCode ?? 400, res.data)
    }
  }
}
