//
//  ComicCell.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

final class ComicCell: UICollectionViewCell {
  private lazy var backgroundImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 10
  }

  private lazy var overlayView = UIView().then {
    $0.backgroundColor = UIColor.black.withAlphaComponent(0.3)
  }

  private lazy var idLabel = UILabel().then {
    $0.font = UIFont.preferredFont(forTextStyle: .headline)
  }

  private lazy var titleLabel = UILabel().then {
    $0.font = UIFont.preferredFont(forTextStyle: .headline)
  }

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubviews([backgroundImageView, overlayView])
    overlayView.addSubviews([idLabel, titleLabel])
    addShadow()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Setup

  private func setupConstraints() {
    activate(
      backgroundImageView.anchor.edges,
      overlayView.anchor.bottom.left.right,
      overlayView.anchor.height.equal.to(anchor.height).multiplier(0.3),
      idLabel.anchor.left.constant(8),
      idLabel.anchor.top.constant(8),
      titleLabel.anchor.top.equal.to(idLabel.anchor.bottom).constant(8),
      titleLabel.anchor.left.constant(8)
    )
  }

  // MARK: - Config

  func configure(id: Int) {
    idLabel.text = "\(id)"
    titleLabel.text = "Loading..."
    backgroundImageView.image = R.image.placeholder()
  }

  func configure(comic: Comic) {
    idLabel.text = "\(comic.id)"
    titleLabel.text = comic.title
    backgroundImageView.setImage(url: comic.image, placeholder: R.image.placeholder())
  }
}
