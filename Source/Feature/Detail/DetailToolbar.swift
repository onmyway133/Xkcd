//
//  DetailToolbar.swift
//  Xkcd
//
//  Created by khoa on 15/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

/// Show as bottom tool bar in detail screen
final class DetailToolbar: UIView {
  private lazy var overlayView = UIView().then {
    $0.backgroundColor = UIColor.black.withAlphaComponent(0.7)
  }

  private(set) lazy var explainButton = UIButton().then {
    let button = UIButton()
    $0.showsTouchWhenHighlighted = true
    $0.setImage(R.image.hint(), for: .normal)
  }

  private(set) lazy var favoriteButton = UIButton().then {
    let button = UIButton()
    $0.showsTouchWhenHighlighted = true
    $0.setImage(R.image.hint(), for: .normal)
  }

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Setup

  private func setup() {
    addSubview(overlayView)
    overlayView.addSubviews([explainButton, favoriteButton])

    activate(
      overlayView.anchor.edges,
      explainButton.anchor.left.constant(12),
      explainButton.anchor.centerY,
      favoriteButton.anchor.right.constant(-12),
      favoriteButton.anchor.centerY
    )
  }
}
