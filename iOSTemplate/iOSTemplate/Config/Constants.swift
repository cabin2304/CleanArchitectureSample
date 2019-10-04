//
//  Constants.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Global constant variables
/*
 Seperating structs but not encapsulated in a big Constant struct to avoid too long call to a constant.
 Using sub structs as much as possible, this approach will make Constant struct organization better.
 In addition, this optimises compiling performance so much as well.
 */

/// Naming Typealias
typealias MessageContent = (title: String, message: String)
typealias Action = () -> Void

struct Constant {
  
  // TODO: TBA
}

// MARK: - Walkthrough
struct Walkthrough {
  
  var title: String
  var desc: String
  var image: UIImage?
}
