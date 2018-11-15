//
//  DetailController.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

final class DetailController: UIViewController {
  private let comic: Comic
  private lazy var scrollView = UIScrollView()
  private lazy var imageView = UIImageView()

  // MARK: - Init

  required init(comic: Comic) {
    self.comic = comic
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
  }

  private func setup() {
    view.addSubview(scrollView)
    scrollView.addSubview(imageView)

    activate(
      scrollView.anchor.edges,
      imageView.anchor.edges
    )
  }
}
