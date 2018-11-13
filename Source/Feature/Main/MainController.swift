//
//  MainController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

final class MainController: UITabBarController {

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    let comicsController = ComicsController()
    comicsController.title = R.string.localizable.comicsTitle()
    comicsController.tabBarItem.image = R.image.comics()

    let favoriteController = FavoriteController()
    favoriteController.title = R.string.localizable.favoriteTitle()
    favoriteController.tabBarItem.image = R.image.favorites()

    viewControllers = [
      UINavigationController(rootViewController: comicsController),
      UINavigationController(rootViewController: favoriteController)
    ]
  }
}
