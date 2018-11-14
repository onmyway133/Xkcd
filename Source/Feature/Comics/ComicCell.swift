//
//  ComicCell.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

final class ComicCell: UICollectionViewCell {
  private lazy var backgroundImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }

  private lazy var overlayView: UIView = UIView().then {
    $0.backgroundColor = UIColor.black.withAlphaComponent(0.3)
  }

  // MARK: - Init

  // MARK: - Config
}
