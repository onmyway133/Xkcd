//
//  Resource.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

// Standard HTTP methods
enum HTTPMethod: String {
  case GET, POST
}

// A network resource, identified by url and parameters
struct Resource {
  let url: URL
  let path: String?
  let httpMethod: String
  let parameters: [String: String]

  init(url: URL, path: String? = nil, httpMethod: HTTPMethod = .GET, parameters: [String: String] = [:]) {
    self.url = url
    self.path = path
    self.httpMethod = httpMethod.rawValue
    self.parameters = parameters
  }
}
