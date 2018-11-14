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
}
