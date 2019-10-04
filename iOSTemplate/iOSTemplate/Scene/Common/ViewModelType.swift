//
//  ViewModelType.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation

protocol ViewModelType {
  
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}
