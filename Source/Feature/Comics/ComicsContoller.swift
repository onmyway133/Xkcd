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

  private var collectionView: UICollectionView!

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  // MARK: - Setup

  private func setup() {
    let layout = UICollectionViewLayout()
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.addSubview(collectionView)

    activate(
      collectionView.anchor.edges
    )
  }
}
