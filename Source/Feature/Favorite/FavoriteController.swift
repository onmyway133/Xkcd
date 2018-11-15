//
//  FavoriteController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

final class FavoriteController: UIViewController {

  private let favoriteManager: FavoriteManager

  // MARK: - Init

  required init(favoriteManager: FavoriteManager) {
    self.favoriteManager = favoriteManager
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor(patternImage: R.image.favoriteBackground()!)
  }
}
