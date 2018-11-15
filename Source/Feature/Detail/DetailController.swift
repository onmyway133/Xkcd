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

  private let stackView = UIStackView()
  private let comic: Comic

  // MARK: - Init

  required init(comic: Comic) {
    self.comic = comic
    super.init(nibName: nil, bundle: nil)
    title = comic.title
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
  }
}
