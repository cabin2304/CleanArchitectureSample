//
//  Scrollable.swift
//  ServiceKit
//

import UIKit

// MARK: - TableView
public extension UITableView {

  /// Adding a custom see more view that contains an activity indicator view
  ///
  /// - Parameter color: color of activity indicator, default is gray color
  func spinningFooter(color: UIColor = .gray) {
    self.tableFooterView = self.initializeIndicator()
  }

  /// Determine whether the last cell is visible on Screen or not
  func isLastCellVisible(reduce: CGFloat = 13) -> Bool {
    if let lastVisibleIdxPath = indexPathsForVisibleRows?.last {
      let lastSection = numberOfSections - 1
      let lastRow = numberOfRows(inSection: lastSection) - 1
      if lastSection == lastVisibleIdxPath.section && lastVisibleIdxPath.row == lastRow {
        if let cell = cellForRow(at: lastVisibleIdxPath) {
          cell.size.height -= reduce
          let rect = convert(cell.frame, to: superview)
          return frame.contains(rect)
        }
      }
    }
    return false
  }

  /// Getting indexpath of last cell
  var lastIndexPath: IndexPath {
    let lastSection = numberOfSections - 1
    let lastRow = numberOfRows(inSection: lastSection) - 1
    return IndexPath(row: lastRow, section: lastSection)
  }
  
  func borderSection(indexPath: IndexPath, cell: UITableViewCell) {
    let isTop = indexPath.row == 0
    let isBottom = indexPath.row == numberOfRows(inSection: indexPath.section) - 1
    if isTop || isBottom {
      let corners: UIRectCorner = isTop && isBottom ? .allCorners : isTop ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight]
      cell.roundBorder(radius: 6, corners: corners)
    } else {
      cell.layer.mask = nil
    }
  }
  
  func borderLastItemSection(indexPath: IndexPath, cell: UITableViewCell) {
    if indexPath.row == numberOfRows(inSection: indexPath.section) - 1 {
      cell.roundBorder(radius: 6, corners: [.bottomLeft, .bottomRight])
    } else {
      cell.layer.mask = nil
    }
  }

}

public extension UIScrollView {

  var isAtTop: Bool {
    return contentOffset.y <= verticalOffsetForTop
  }

  var isAtBottom: Bool {
    return contentOffset.y >= verticalOffsetForBottom
  }

  var verticalOffsetForTop: CGFloat {
    let topInset = contentInset.top
    return -topInset
  }

  var verticalOffsetForBottom: CGFloat {
    let scrollViewHeight = bounds.height
    let scrollContentSizeHeight = contentSize.height
    let bottomInset = contentInset.bottom
    let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
    return scrollViewBottomOffset
  }

  func scrollToBottom(animated: Bool = true) {
    let ypos = verticalOffsetForBottom
    let xpos = contentOffset.x
    setContentOffset(CGPoint(x: xpos, y: ypos), animated: animated)
  }

  func scrollToTop(animated: Bool = true) {
    setContentOffset(.zero, animated: animated)
  }
}

public extension UITableViewCell {

  func optimization() {
    /// Using masksToBounds on cell might leak memory and cause scrolling laggy
    /// These code will help to avoid this issue
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
}

public extension UICollectionViewCell {

  func optimization() {
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
}

// MARK: - UICollectionView
public extension UICollectionView {
  
  func scrollToIndexPathIfNotVisible(_ indexPath: IndexPath) {
    let section = indexPath.section
    if indexPath.row < self.numberOfItems(inSection: section) {
      self.scrollToItem(at: indexPath, at: [.bottom, .centeredHorizontally], animated: false)
    }
    self.layoutIfNeeded()
  }

  func scrollToAndGetCell(atIndexPath indexPath: IndexPath) -> UICollectionViewCell! {
    scrollToIndexPathIfNotVisible(indexPath)
    return self.cellForItem(at: indexPath)
  }
}

