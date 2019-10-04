//
//  PostUseCaseProtocol.swift
//  Domain
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import RxSwift
import AWSAppSync

public typealias PostItem = AllPostsQuery.Data.ListPost.Item
public typealias NewPostItem = PostBrief

public enum PerformState {
  case updated
  case deleted
  case completed
}

/// Make the useCase testable by taking use of protocol
public protocol AWSPostUseCaseProtocol {
  
  func updatePost(post: NewPostItem, onOptimistic: Bool) -> Observable<APIResponse<(PerformState, PostItem?)>>
  func fetch(limit: Int?, token: String?, cachePolicy: CachePolicy) -> Observable<APIResponse<(list: [PostItem], token: String?)>>
  func fetchAllCache() -> Observable<[PostItem]>
  func create(post: NewPostItem, onOptimistic: Bool) -> Observable<APIResponse<Bool>>
  
  func subscribe<T: GraphQLSubscription>(for type: T, regression: ((Cancelable) -> Void)?) -> Observable<(ApolloStore.ReadWriteTransaction?, PostItem)>
}
