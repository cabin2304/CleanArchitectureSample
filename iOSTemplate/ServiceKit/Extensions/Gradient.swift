//
//  Gradient.swift
//  ServiceKit
//

import UIKit

public extension CAGradientLayer {

  enum Direction: Int {
    
    case t2b = 0, l2r, b2t, r2l, bl2tr, tl2br, tr2bl, br2tl
  }
  
  convenience init(frame: CGRect, colors: [UIColor], style: Direction) {
    self.init()
    self.frame = frame
    self.colors = []
    for color in colors {
      self.colors?.append(color.cgColor)
    }
    switch style {
    case .l2r:
      (startPoint, endPoint) = (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
    case .r2l:
      (startPoint, endPoint) = (CGPoint(x: 1, y: 0.5), CGPoint(x: 0, y: 0.5))
    case .t2b:
      (startPoint, endPoint) = (CGPoint(x: 0.5, y: 0), CGPoint(x: 0.5, y: 1))
    case .b2t:
      (startPoint, endPoint) = (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
    case .bl2tr:
      (startPoint, endPoint) = (CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0))
    case .tl2br:
      (startPoint, endPoint) = (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1))
    case .tr2bl:
      (startPoint, endPoint) = (CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1))
    case .br2tl:
      (startPoint, endPoint) = (CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 0))
    }
    
  }

  func creatGradientImage() -> UIImage? {

    var image: UIImage?
    UIGraphicsBeginImageContext(bounds.size)
    if let context = UIGraphicsGetCurrentContext() {
      render(in: context)
      image = UIGraphicsGetImageFromCurrentImageContext()
    }
    UIGraphicsEndImageContext()
    return image
  }
}

