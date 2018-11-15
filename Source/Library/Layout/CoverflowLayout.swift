//
//  CoverflowLayout.swift
//  Xkcd
//
//  Created by khoa on 15/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

/// Custom coverflow layout
final class CoverflowLayout: UICollectionViewFlowLayout {

  // MARK: - Init

  override init() {
    super.init()

    scrollDirection = .horizontal
    sectionInset = .zero
    minimumLineSpacing = 0
    minimumInteritemSpacing = 0
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Override

  // Use our custom attributes class
  override class var layoutAttributesClass: AnyClass {
    return MyAttributes.self
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let attributes = super.layoutAttributesForElements(in: rect) else {
      return nil
    }

    return attributes
      .compactMap({ $0.copy() as? MyAttributes })
      .map({ self.process($0) })
  }

  // Always invalidate when scrolling
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

  // Process layout
  private func process(_ attributes: MyAttributes) -> UICollectionViewLayoutAttributes {
    guard let collectionView = self.collectionView else {
      return attributes
    }

    let width = collectionView.frame.width
    let itemOffset = attributes.center.x - collectionView.contentOffset.x

    // How far from the middle
    let middleOffset = itemOffset / width - 0.5

    // Customise scale and alpha
    let minAlpha: CGFloat = 0.5
    let itemSpacing: CGFloat = 0.4
    let scaleRate: CGFloat = 0.7

    let scaleFactor = scaleRate - 0.1 * abs(middleOffset)
    let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)

    let translationX = -(width * itemSpacing * middleOffset)
    let translationTransform = CGAffineTransform(translationX: translationX, y: 0)

    attributes.alpha = 1.0 - abs(middleOffset) + minAlpha
    attributes.transform = translationTransform.concatenating(scaleTransform)
    return attributes
  }
}

class MyAttributes: UICollectionViewLayoutAttributes {
  public override func copy(with zone: NSZone? = nil) -> Any {
    // swiftlint:disable force_cast
    let copy = super.copy(with: zone) as! MyAttributes
    return copy
  }

  public override func isEqual(_ object: Any?) -> Bool {
    guard let object = object as? MyAttributes else {
      return false
    }

    return super.isEqual(object)
  }
}
