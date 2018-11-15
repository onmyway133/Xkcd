//
//  FavoriteManager.swift
//  Xkcd
//
//  Created by khoa on 15/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

/// Keep favorite information
final class FavoriteManager {
  private(set) var comics = [Comic]()

  // MARK: = Persistence

  func load() {

  }

  func save() {

  }

  // MARK: - Star

  func star(comic: Comic) {

  }

  func unstar(comic: Comic) {

  }

  /// Check if a comic is starred
  func isStarred(comic: Comic) -> Bool {
    return false
  }
}
