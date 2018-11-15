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

  let comicService = ComicService(networking: NetworkService(configuration: .default))
  let favoriteManager = FavoriteManager()

  /// Start the flow
  func start() {
    let controller = MainController(
      comicService: comicService,
      favoriteManager: favoriteManager
    )

    add(childViewController: controller)
  }
}
