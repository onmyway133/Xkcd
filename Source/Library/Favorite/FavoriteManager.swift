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
  private let queue = DispatchQueue(label: "FavoriteManager")
  private let codableStorage = CodableStorage(fileName: "favorites")

  // MARK: = Persistence

  /// Load all favorite from disk
  func load() {
    queue.async {
      self.comics = (try? self.codableStorage.load()) ?? []
    }
  }

  /// Save all favorite to disk
  func save() {
    queue.async {
      try? self.codableStorage.save(objects: self.comics)
    }
  }

  // MARK: - Star

  /// Toggle favorite status
  ///
  /// - Parameter comic: The comic to toggle
  func toggle(comic: Comic) {
    if isStarred(comic: comic) {
      unstar(comic: comic)
    } else {
      star(comic: comic)
    }
  }

  private func star(comic: Comic) {
    comics.append(comic)
  }

  private func unstar(comic: Comic) {
    guard let index = comics.firstIndex(where: { $0.id == comic.id }) else {
      return
    }

    comics.remove(at: index)
  }

  /// Check if a comic is starred
  func isStarred(comic: Comic) -> Bool {
    return comics.contains(where: { $0.id == comic.id })
  }
}
