//
//  Either.swift
//  Xkcd
//
//  Created by khoa on 14/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

// Contain either of 2 values
enum Either<A, B> {
  case left(A)
  case right(B)
}
