//
//  CodableStorage.swift
//  Xkcd
//
//  Created by khoa on 15/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

/// Save and load codable objects
final class CodableStorage {
  private let fileName: String
  private let fileUrl: URL
  private let fileManager: FileManager

  init(fileName: String, fileManager: FileManager = FileManager.default) {
    self.fileName = fileName
    self.fileManager = fileManager

    guard let url = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else {
      fatalError()
    }

    self.fileUrl = url.appendingPathComponent(fileName)
  }

  func save<T: Codable>(objects: T) throws {
    let data = try JSONEncoder().encode(objects)
    try data.write(to: fileUrl)
  }

  func load<T: Codable>() throws -> T {
    let data = try Data(contentsOf: fileUrl)
    return try JSONDecoder().decode(T.self, from: data)
  }
}
