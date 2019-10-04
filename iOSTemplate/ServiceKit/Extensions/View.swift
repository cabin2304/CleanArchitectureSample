//
//  View.swift
//  ServiceKit
//

import UIKit
import QuartzCore

// MARK: - UIView
public extension UIView {

  func snapshot() -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
    drawHierarchy(in: bounds, afterScreenUpdates: true)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
  }

  func roundBorder(radius: CGFloat, width: CGFloat = 0, color: CGColor = UIColor.clear.cgColor, corners: UIRectCorner = .allCorners) {
    if corners == .allCorners {
      self.layer.cornerRadius = radius
      self.layer.borderWidth = width
      self.layer.borderColor = color
      self.layer.masksToBounds = true
    } else {
      let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
      let shapeLayer = CAShapeLayer()
      shapeLayer.frame = bounds
      shapeLayer.path = maskPath.cgPath
      shapeLayer.borderColor = color
      shapeLayer.borderWidth = width
      layer.mask = shapeLayer
    }
  }

  func dashedBorder(radius: CGFloat, width: CGFloat = 0, color: CGColor = UIColor.clear.cgColor) {

    let  borderLayer = CAShapeLayer()
    let frameSize = self.frame.size
    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

    borderLayer.bounds=shapeRect
    borderLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    borderLayer.fillColor = UIColor.clear.cgColor
    borderLayer.strokeColor = color
    borderLayer.lineWidth = width
    borderLayer.cornerRadius = radius
    borderLayer.masksToBounds = true
    borderLayer.lineJoin = .round
    borderLayer.lineDashPattern = NSArray(array: [NSNumber(value: 5), NSNumber(value:5)]) as? [NSNumber]

    let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: radius)
    borderLayer.path = path.cgPath
    self.layer.addSublayer(borderLayer)
  }

  func makeCircle(withHeight: Bool? = false) {
    self.layer.cornerRadius =  (withHeight != nil && withHeight == true) ? self.height/2 : self.width/2
    self.layer.masksToBounds = true
  }

  func rotateCycle() {
    rotate(rad: .pi * 2, duration: 0.5)
  }

  static func createIndicator() -> UIImageView {
    let indicator = UIImageView(image: #imageLiteral(resourceName: "animLoadingGray"))
    indicator.size = CGSize(width: 30, height: 30)
    return indicator
  }

  func initializeIndicator(height: CGFloat = 50) -> UIView {
    let indicator = UIView.createIndicator()

    let seemoreView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    seemoreView.backgroundColor = .clear
    indicator.center = seemoreView.center
    seemoreView.addSubview(indicator)
    indicator.rotate(rad: .pi * 2, duration: 0.5)
    return seemoreView
  }

  func isKind(classNamed: String) -> Bool {
    if let targetClass = NSClassFromString(classNamed) {
      return self.isKind(of: targetClass)
    }
    return false
  }

  /// Convert origin point of sender's superview into another view's superview
  ///
  /// - Parameters:
  ///   - sender: target view
  ///   - view: destination view
  /// - Returns: converted point
  func convertOrigin(to view: UIView) -> CGPoint? {
    let sp2View = superview?.superview
    if let point1 = superview?.convert(frame.origin, to: sp2View),
      let point = sp2View?.convert(point1, to: view){
      return point
    }
    return nil
  }

  /// A common public function for loading view from nib
  ///
  /// - Returns: a view
  @discardableResult
  func fromNib<T: UIView>() -> T? {
    guard let view = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first as? T else {
      return nil
    }

    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
    return view
  }

  var x: CGFloat {
    get { return self.frame.x }
    set { self.frame.x = newValue }
  }

  var y: CGFloat {
    get { return self.frame.y }
    set { self.frame.y = newValue }
  }

  var width: CGFloat {
    get { return self.frame.width }
    set { self.frame.size.width = newValue }
  }

  var height: CGFloat {
    get { return self.frame.height }
    set { self.frame.size.height = newValue }
  }

  var size: CGSize {
    get { return self.frame.size }
    set { self.frame.size = newValue }
  }

  var origin: CGPoint {
    get { return self.frame.origin }
    set { self.frame.origin = newValue }
  }

  var addSize: CGFloat {
    get { return 0 }
    set {
      width += newValue
      height += newValue
    }
  }
}

extension UIView {
  
  public enum Edge {
    case top, left, bottom, right, all,
    topleft, bottomright, topright, bottomleft
  }
  
  public func makeShadow(opacity: Float = 0.5, radius: CGFloat = 2, offset: CGFloat = 3, color: UIColor = .gray, spread: CGFloat = 0, edge: Edge = .all) {
    self.layer.shadowOpacity = opacity
    self.layer.shadowRadius = radius
    self.layer.shadowColor = color.cgColor
    switch edge {
    case .all: self.layer.shadowOffset = .zero
    case .top: self.layer.shadowOffset = CGSize(width: 0, height: -offset)
    case .left: self.layer.shadowOffset = CGSize(width: -offset, height: 0)
    case .right: self.layer.shadowOffset = CGSize(width: offset, height: 0)
    case .bottom: self.layer.shadowOffset = CGSize(width: 0, height: offset)
    case .bottomleft: self.layer.shadowOffset = CGSize(width: -offset, height: offset)
    case .bottomright: self.layer.shadowOffset = CGSize(width: offset, height: offset)
    case .topleft: self.layer.shadowOffset = CGSize(width: -offset, height: -offset)
    case .topright: self.layer.shadowOffset = CGSize(width: offset, height: -offset)
    }
    if spread == 0 {
      self.layer.shadowPath = nil
    } else {
      let dx = -spread
      let rect = layer.bounds.insetBy(dx: dx, dy: dx)
      self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
    }
    self.layer.masksToBounds = false
  }
}

// Getting frame's components
public extension CGRect {

  var x: CGFloat {
    get { return self.origin.x }
    set { self.origin.x = newValue }
  }

  var y: CGFloat {
    get { return self.origin.y }
    set { self.origin.y = newValue }
  }

  var doubleSize: CGSize {
    get { return CGSize(width: size.width * 2, height: size.height * 2) }
    set { self.size = newValue }
  }

  var addSize: CGFloat {
    get { return 0 }
    set {
      size.width += newValue
      size.height += newValue
    }
  }
  var subOrigin: CGFloat {
    get { return 0 }
    set {
      x -= newValue
      y -= newValue
    }
  }
}

extension CGSize {

  public func math(_ f: (CGFloat, CGFloat) -> CGFloat, _ x: CGFloat) -> CGSize {
    return CGSize(width: f(width, x), height: f(height, x))
  }
}

extension CGPoint {
  
  public var magnitude: CGFloat {
    return CGFloat(sqrtf(powf(Float(x), 2) + powf(Float(y), 2)))
  }
}

extension UIStoryboard {
  
  public convenience init<T: RawRepresentable>(storyboard identifer: T) where T.RawValue == String {
    self.init(name: identifer.rawValue, bundle: nil)
  }
  
  public convenience init(storyboard identifer: String) {
    self.init(name: identifer, bundle: nil)
  }
  
  public func instantiate<VC: UIViewController, T: RawRepresentable>(scene identifier: T, ofType _: VC.Type) -> VC where T.RawValue == String {
    // swiftlint:disable force_cast
    return instantiateViewController(withIdentifier: identifier.rawValue) as! VC
  }
  
  public func instantiate<T: UIViewController>(_ viewController: T.Type) -> T {
    // swiftlint:disable force_cast
    return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
  }
}
