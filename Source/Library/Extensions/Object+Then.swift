//
//  Object+Then.swift
//  Xkcd
//
//  Created by khoa on 14/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

/// Convenient protocol to configure object, inspired by Kotlin
/// https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/src/kotlin/util/Standard.kt
protocol Then {}

extension Then {
  func then(configure: (Self) -> Void) -> Self {
    configure(self)
    return self
  }
}

extension NSObject: Then {}
