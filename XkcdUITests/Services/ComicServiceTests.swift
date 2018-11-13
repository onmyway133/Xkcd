//
//  ComicServiceTests.swift
//  XkcdUITests
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import XCTest
@testable import Xkcd

class ComicServiceTests: XCTestCase {
  func testFetchCurrent() {
    let expectation = self.expectation(description: #function)
    let mockNetworkService = NetworkServiceMock(fileName: "currentComic")
    let comicService = ComicService(networking: mockNetworkService)
    comicService.fetchCurrent(completion: { comic in
      XCTAssertNotNil(comic)
      XCTAssertEqual(comic!.title, "Indirect Detection")
      XCTAssertEqual(comic!.image, URL(string: "https://imgs.xkcd.com/comics/indirect_detection.png")!)
      XCTAssertEqual(comic!.id, 2071)
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 1)
  }

  func testFetchComic() {
    let expectation = self.expectation(description: #function)
    let mockNetworkService = NetworkServiceMock(fileName: "comic614")
    let comicService = ComicService(networking: mockNetworkService)
    comicService.fetchComic(id: 614, completion: { comic in
      XCTAssertNotNil(comic)
      XCTAssertEqual(comic!.title, "Woodpecker")
      XCTAssertEqual(comic!.image, URL(string: "https://imgs.xkcd.com/comics/woodpecker.png")!)
      XCTAssertEqual(comic!.id, 614)
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 1)
  }
}
