//
//  Comic.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

// A xkcd comic
struct Comic: Codable {

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
    case image
    case title
  }

  let num: Int
  let day: Int
  let month: Int
  let year: Int
  let link: String
  let news: String
  let safeTitle: String
  let transcript: String
  let alternativeText: String
  let image: URL
  let title: String
}
