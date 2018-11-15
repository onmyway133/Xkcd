//
//  ImageView+Extensions.swift
//  XkcdUITests
//
//  Created by khoa on 14/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

extension UIImageView {
  /// Used to set image from an url
  ///
  /// - Parameter url: url for download
  func setImage(url: URL, placeholder: UIImage? = nil) {
    if imageService == nil {
      imageService = ImageService(networkService: NetworkService(), cacheService: CacheService())
    }

    self.image = placeholder
    self.imageService?.fetch(url: url, completion: { [weak self] image in
      self?.animate(newImage: image)
    })
  }

  /// Use for store property
  private var imageService: ImageService? {
    get {
      return objc_getAssociatedObject(self, &AssociateKey.imageService) as? ImageService
    }
    set {
      objc_setAssociatedObject(
        self,
        &AssociateKey.imageService,
        newValue,
        objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }

  func animate(newImage: UIImage?) {
    UIView.transition(
      with: self,
      duration: 0.2,
      options: .transitionCrossDissolve,
      animations: {
        self.image = newImage
      },
      completion: nil
    )
  }
}

private struct AssociateKey {
  static var imageService = 0
}
