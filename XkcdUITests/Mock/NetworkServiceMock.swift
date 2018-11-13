//
//  NetworkServiceMock.swift
//  XkcdUITests
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation
@testable import Xkcd

final class NetworkServiceMock: Networking {
  private let data: Data
  init(fileName: String) {
    let bundle = Bundle(for: NetworkServiceMock.self)
    let url = bundle.url(forResource: fileName, withExtension: "json")!
    self.data = try! Data(contentsOf: url)
  }

  func fetch(resource: Resource, completion: @escaping (Data?) -> Void) -> URLSessionTask? {
    completion(data)
    return nil
  }
}

