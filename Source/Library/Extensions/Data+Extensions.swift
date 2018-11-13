//
//  Data+Extensions.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

extension Data {
  func decoded<T: Decodable>() throws -> T {
    return try JSONDecoder().decode(T.self, from: self)
  }
}
