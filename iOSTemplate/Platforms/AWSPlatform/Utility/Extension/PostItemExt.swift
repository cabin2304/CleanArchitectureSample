//
//  PostItemExt.swift
//  AWSPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import Domain

// MARK: - AllPostsQuery

extension AllPostsQuery.Data.ListPost.Item {
  func toPost() -> PostItem {
    let post = PostItem(snapshot: self.snapshot)
    return post
  }
}

extension PostItem {
  func toPost() -> AllPostsQuery.Data.ListPost.Item {
    let post = AllPostsQuery.Data.ListPost.Item(snapshot: self.snapshot)
    return post
  }
}

