//
//  MainController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import SafariServices

final class MainController: UITabBarController {

  private var comicsController: ComicsController!
  private var favoriteController: FavoriteController!
  private var comicNavigationController: UINavigationController!
  private var favoriteNavigationController: UINavigationController!

  private let comicService: ComicService
  private let favoriteManager: FavoriteManager

  // MARK: - Init

  required init(comicService: ComicService, favoriteManager: FavoriteManager) {
    self.comicService = comicService
    self.favoriteManager = favoriteManager
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    comicsController = ComicsController(comicService: comicService)
    favoriteController = FavoriteController(favoriteManager: favoriteManager)

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

  private func handleFlow() {
    typealias Function = (UINavigationController) -> (Comic) -> Void
    let selectComic: Function = { [weak self] navigationController in
      return { (comic: Comic) in
        guard let self = self else {
          return
        }

        let detailController = self.makeDetail(comic: comic)
        navigationController.pushViewController(detailController, animated: true)
      }
    }

    comicsController.selectComic = selectComic(comicNavigationController)
    favoriteController.selectComic = selectComic(favoriteNavigationController)
  }

  private func makeDetail(comic: Comic) -> DetailController {
    let detailController = DetailController(comic: comic, favoriteManager: favoriteManager)
    detailController.explainComic = { [weak self] comic in
      self?.showExplain(comic: comic)
    }

    return detailController
  }

  private func showExplain(comic: Comic) {
    guard let url = URL(string: "https://www.explainxkcd.com/wiki/index.php/\(comic.id)") else {
      fatalError()
    }

    let controller = SFSafariViewController(url: url)
    present(controller, animated: true, completion: nil)
  }
}
