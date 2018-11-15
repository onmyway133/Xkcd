//
//  MainController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

final class MainController: UITabBarController {

  private let comicsController: ComicsController
  private let favoriteController: FavoriteController
  private var comicNavigationController: UINavigationController!
  private var favoriteNavigationController: UINavigationController!

  // MARK: - Init

  required init(comicsController: ComicsController, favoriteController: FavoriteController) {
    self.comicsController = comicsController
    self.favoriteController = favoriteController
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    comicsController.title = R.string.localizable.comicsTitle()
    comicsController.tabBarItem.image = R.image.comics()

    favoriteController.title = R.string.localizable.favoriteTitle()
    favoriteController.tabBarItem.image = R.image.favorites()

    comicNavigationController = UINavigationController(rootViewController: comicsController)
    favoriteNavigationController = UINavigationController(rootViewController: favoriteController)

    viewControllers = [
      comicNavigationController,
      favoriteNavigationController
    ]

    handleFlow()
  }

  func handleFlow() {
    comicsController.selectComic = { [weak self] comic in
      let detailController = DetailController(comic: comic)
      self?.comicNavigationController.pushViewController(detailController, animated: true)
    }
  }
}
