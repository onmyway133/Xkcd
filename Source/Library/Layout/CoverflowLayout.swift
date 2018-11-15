//
//  CoverflowLayout.swift
//  Xkcd
//
//  Created by khoa on 15/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

final class CoverflowLayout: UICollectionViewFlowLayout {

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let attributes = super.layoutAttributesForElements(in: rect) else {
      return nil
    }

    return attributes
      .compactMap({ $0.copy() as? MyAttributes })
      .map({ self.process($0) })
  }

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

  private func process(_ attributes: MyAttributes) -> UICollectionViewLayoutAttributes {
    return attributes
  }
}

class MyAttributes: UICollectionViewLayoutAttributes {

}
