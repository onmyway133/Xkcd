//
//  View+Extensions.swift
//  Xkcd
//
//  Created by khoa on 14/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

extension UIView {
  func addSubviews(_ subviews: [UIView]) {
    subviews.forEach {
      addSubview($0)
    }
  }

  func addShadow() {
    layer.shadowOffset = CGSize(width: 2, height: 2)
    layer.shadowOpacity = 0.5
    layer.shadowColor = UIColor.black.cgColor
  }
}
