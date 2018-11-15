//
//  FavoriteController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

final class FavoriteController: UIViewController {

  private let favoriteManager: FavoriteManager
  private var collectionView: UICollectionView!
  private let adapter = Adapter<Comic, ComicCell>()
  /// Called when a comic is selected
  var selectComic: ((Comic) -> Void)?

  // MARK: - Init

  required init(favoriteManager: FavoriteManager) {
    self.favoriteManager = favoriteManager
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor(patternImage: R.image.favoriteBackground()!)
    setupCollectionView()
    setupAdapter()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    loadData()
  }

  // MARK: - Setup

  private func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical

    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(cellType: ComicCell.self)
    collectionView.dataSource = adapter
    collectionView.delegate = adapter
    collectionView.isPagingEnabled = true
    collectionView.backgroundColor = .clear
    view.addSubview(collectionView)

    activate(
      collectionView.anchor.edges
    )
  }

  private func setupAdapter() {
    adapter.configure = { comic, cell in
      cell.configure(comic: comic)
    }

    adapter.select = { [weak self] comic in
      self?.selectComic?(comic)
    }

    adapter.size = { containerSize in
      return CGSize(
        width: containerSize.width * 0.8,
        height: containerSize.height * 0.5
      )
    }
  }

  // MARK: - Data

  private func loadData() {
    adapter.items = favoriteManager.comics
    collectionView.reloadData()
  }
}
