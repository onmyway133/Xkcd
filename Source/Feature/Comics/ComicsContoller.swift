//
//  ComicsContoller.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

final class ComicsController: UIViewController {

  private let comicService: ComicService
  private var collectionView: UICollectionView!
  private let adapter = Adapter<Either<Int, Comic>, ComicCell>()
  private let debouner = Debouncer(delay: 0.5)

  /// Called when a comic is selected
  var selectComic: ((Comic) -> Void)?

  // MARK: - Init

  required init(comicService: ComicService) {
    self.comicService = comicService
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor(patternImage: R.image.background()!)

    setupCollectionView()
    setupAdapter()
    loadData()
  }

  // MARK: - Setup

  private func setupCollectionView() {
    let layout = CoverflowLayout()

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
    adapter.configure = { model, cell in
      switch model {
      case .left(let id):
        cell.configure(id: id)
      case .right(let comic):
        cell.configure(comic: comic)
      }
    }

    adapter.display = { [weak self] model, indexPath in
      switch model {
      case .left(let id):
        self?.debouner.schedule {
          self?.loadComic(id: id, indexPath: indexPath)
        }
      default:
        break
      }
    }

    adapter.select = { [weak self] model in
      switch model {
      case .right(let comic):
        self?.selectComic?(comic)
      default:
        break
      }
    }
  }

  // MARK: - Data

  private func loadData() {
    comicService.fetchCurrent(completion: { [weak self] comic in
      guard let comic = comic else {
        return
      }

      DispatchQueue.main.async {
        self?.populate(currentComic: comic)
      }
    })
  }

  private func loadComic(id: Int, indexPath: IndexPath) {
    comicService.fetchComic(id: id, completion: { comic in
      guard let comic = comic else {
        return
      }

      DispatchQueue.main.async {
        self.adapter.items[indexPath.row] = Either.right(comic)
//        self.collectionView.reloadItems(at: [indexPath])
        // reloadItems may trigger layout to reinvalidate
        self.collectionView.reloadData()
      }
    })
  }

  /// Populate data source starting from current comic backward
  private func populate(currentComic: Comic) {
    var items: [Either<Int, Comic>] = Array(0..<currentComic.id).map({
      return Either.left($0)
    })

    items.append(Either.right(currentComic))
    adapter.items = items

    collectionView.reloadData()
    DispatchQueue.main.async {
      self.collectionView.scrollToLast(count: items.count)
    }
  }
}
