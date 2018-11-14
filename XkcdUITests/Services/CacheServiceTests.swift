//
//  CacheServiceTests.swift
//  XkcdUITests
//
//  Created by khoa on 14/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import XCTest
@testable import Xkcd

class CacheServiceTests: XCTestCase {
  let service = CacheService()

  override func setUp() {
    super.setUp()

    try? service.clear()
  }

  func testClear() {
    let expectation = self.expectation(description: #function)
    let string = "Hello world"
    let data = string.data(using: .utf8)!

    service.save(data: data, key: "key", completion: {
      try? self.service.clear()
      self.service.load(key: "key", completion: {
        XCTAssertNil($0)
        expectation.fulfill()
      })
    })

    wait(for: [expectation], timeout: 1)
  }

  func testSave() {
    let expectation = self.expectation(description: #function)
    let string = "Hello world"
    let data = string.data(using: .utf8)!

    service.save(data: data, key: "key")
    service.load(key: "key", completion: {
      XCTAssertEqual($0, data)
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 1)
  }
}

