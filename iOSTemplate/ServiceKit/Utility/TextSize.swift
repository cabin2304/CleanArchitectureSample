//
//  TextSize.swift
//  ServiceKit
//

import UIKit

public struct TextSize {

  fileprivate struct CacheEntry: Hashable {
    
    let text: String
    let font: UIFont
    let width: CGFloat
    let insets: UIEdgeInsets
    let lineHeight: CGFloat

    func hash(into hasher: inout Hasher) {
      [text.hashValue, Int(width), Int(insets.top), Int(insets.left), Int(insets.bottom), Int(insets.right), Int(lineHeight)].forEach{ hasher.combine($0) }
    }
  }

  fileprivate static var cache = [CacheEntry: CGSize]()

  public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = UIEdgeInsets.zero, lineHeight: CGFloat = 0, lines: Int = 1) -> CGSize {
    let key = CacheEntry(text: text, font: font, width: width, insets: insets, lineHeight: lineHeight)
    if let hit = cache[key] {
      return hit
    }
    let size = font.sizeOfString(string: text, lineHeight: lineHeight, constrainedToWidth: width)
    cache[key] = size
    return size
  }
}

private func == (lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
  return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
}
