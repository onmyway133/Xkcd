//
//  ImageService.swift
//  XkcdUITests
//
//  Created by khoa on 14/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

/// Check local cache and fetch remote image
final class ImageService {

  private let networkService: Networking
  private let cacheService: CacheService
  private var task: URLSessionTask?

  init(networkService: Networking, cacheService: CacheService) {
    self.networkService = networkService
    self.cacheService = cacheService
  }

  /// Fetch image from url
  ///
  /// - Parameters:
  ///   - url: The remote url for image
  ///   - completion: Called when operation finishes
  func fetch(url: URL, completion: @escaping (UIImage?) -> Void) {
    // Cancel existing task if any
    task?.cancel()

    // Try load from cache
    cacheService.load(key: url.absoluteString, completion: { [weak self] cachedData in
      if let data = cachedData, let image = UIImage(data: data) {
        DispatchQueue.main.async {
          completion(image)
        }
      } else {
        // Try to request from network
        let resource = Resource(url: url)
        self?.task = self?.networkService.fetch(resource: resource, completion: { networkData in
          if let data = networkData, let image = UIImage(data: data) {
            // Save to cache
            self?.cacheService.save(data: data, key: url.absoluteString)
            DispatchQueue.main.async {
              completion(image)
            }
          } else {
            print("Error loading image at \(url)")
          }
        })

        self?.task?.resume()
      }
    })
  }
}
