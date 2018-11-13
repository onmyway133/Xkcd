//
//  DebouncerTests.swift
//  XkcdTests
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import XCTest
@testable import Xkcd

class DebouncerTests: XCTestCase {
  func testDebouncing() {
    let cancelExpectation = self.expectation(description: "cancel")
    cancelExpectation.isInverted = true

    let completeExpectation = self.expectation(description: "complete")
    let debouncer = Debouncer(delay: 0.3)

    debouncer.schedule {
      cancelExpectation.fulfill()
    }

    debouncer.schedule {
      completeExpectation.fulfill()
    }

    wait(for: [cancelExpectation, completeExpectation], timeout: 1)
  }
}
