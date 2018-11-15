//
//  Comic.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

// A xkcd comic
struct Comic: Codable, Hashable {

  enum CodingKeys: String, CodingKey {
    case safeTitle = "safe_title"
    case alternativeText = "alt"
    case num
    case day
    case month
    case year
    case link
    case news
    case transcript
    case image = "img"
    case title
  }

  let num: Int
  let day: String
  let month: String
  let year: String
  let link: String
  let news: String
  let safeTitle: String
  let transcript: String
  let alternativeText: String
  let image: URL
  let title: String

  var id: Int {
    return num
  }
}
