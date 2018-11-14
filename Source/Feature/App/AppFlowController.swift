//
//  AppFlowController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

import UIKit

/// Manage app flow
final class AppFlowController: UIViewController {
  /// Start the flow
  func start() {
    let comicService = ComicService(networking: NetworkService(configuration: .default))
    let comicsController = ComicsController(comicService: comicService)
    let favoriteController = FavoriteController()

    let controller = MainController(comicsController: comicsController, favoriteController: favoriteController)
    add(childViewController: controller)
  }
}
