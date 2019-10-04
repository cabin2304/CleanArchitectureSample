//
//  Meta.swift
//  Domain
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

public struct Meta: Codable {
  
  public let limit: Int
  public let offset: Int
  public let totalCount: Int
  
  enum CodingKeys: String, CodingKey {
    case limit, offset
    case totalCount = "total_count"
  }
}

