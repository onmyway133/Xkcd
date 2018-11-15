//
//  CollectionView+Extensions.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

extension UICollectionView {

  /// Generic function to dequeue cell
  func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
    // swiftlint:disable force_cast
    return dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
  }

  /// Generic function to register cell
  func register(cellType: UICollectionViewCell.Type) {
    register(cellType, forCellWithReuseIdentifier: String(describing: cellType.self))
  }

  func scrollToLast(count: Int) {
    let indexPath = IndexPath(item: count-1, section: 0)
    scrollToItem(at: indexPath, at: .right, animated: true)
  }

  func visibleIndexPath() -> IndexPath? {
    let visibleRect = CGRect(origin: contentOffset, size: bounds.size)
    let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
    return indexPathForItem(at: visiblePoint)
  }
}
