//
//  DetailController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors
import On

final class DetailController: UIViewController {
  private let comic: Comic
  private let favoriteManager: FavoriteManager

  private lazy var scrollView = UIScrollView()
  private lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
  }

  private lazy var toolbar = DetailToolbar()
  var explainComic: ((Comic) -> Void)?

  // MARK: - Init

  required init(comic: Comic, favoriteManager: FavoriteManager) {
    self.comic = comic
    self.favoriteManager = favoriteManager
    super.init(nibName: nil, bundle: nil)
    title = "#\(comic.id) \(comic.title)"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    setup()
    handleActions()
    loadData()
    updateUI()
  }

  private func setup() {
    view.addSubviews([scrollView, toolbar])
    scrollView.addSubview(imageView)

    scrollView.delegate = self
    scrollView.maximumZoomScale = 10

    activate(
      scrollView.anchor.edges,
      toolbar.anchor.left.right,
      toolbar.anchor.height.equal.to(50),
      imageView.anchor.edges
    )

    activate(
      toolbar.anchor.bottom.equal.to(view.safeAreaLayoutGuide.anchor.bottom)
    )
  }

  private func handleActions() {
    toolbar.explainButton.on.tap { [weak self] in
      guard let self = self else {
        return
      }

      self.explainComic?(self.comic)
    }

    toolbar.favoriteButton.on.tap { [weak self] in
      guard let self = self else {
        return
      }

      self.favoriteManager.toggle(comic: self.comic)
      self.updateUI()
    }
  }

  private func loadData() {
    imageView.setImage(url: comic.image)
  }

  private func updateUI() {
    let image = favoriteManager.isStarred(comic: comic) ? R.image.starred() : R.image.unstar()
    toolbar.favoriteButton.setImage(image, for: .normal)
  }
}

extension DetailController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}
