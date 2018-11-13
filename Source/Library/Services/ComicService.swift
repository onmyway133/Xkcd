//
//  ComicService.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

// Fetch comics https://xkcd.com/json.html
final class ComicService {
  private let baseUrl = URL(string: "https://xkcd.com")!
  private let networking: Networking

  init(networking: Networking) {
    self.networking = networking
  }

  /// Fetch current
  ///
  /// - Parameter completion: Called when operation finishes
  func fetchCurrent(completion: @escaping (Comic?) -> Void) {
    let resource = Resource(url: baseUrl, path: "info.0.json")
    networking.fetch(resource: resource, completion: { data in
      if let data = data {
        completion(try? data.decoded())
      } else {
        completion(nil)
      }
    })
  }

  /// Fetch comic by id
  ///
  /// - Parameter completion: Called when operation finishes
  func fetchComic(id: Int, completion: @escaping (Comic?) -> Void) {
    let resource = Resource(url: baseUrl, path: "\(id)/info.0.json")
    networking.fetch(resource: resource, completion: { data in
      if let data = data {
        completion(try? data.decoded())
      } else {
        completion(nil)
      }
    })
  }
}
