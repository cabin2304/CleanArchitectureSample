//
//  FileManagement.swift
//  ServiceKit
//

import UIKit

public struct FileService {

  /// Checking if there has cached images than removing them
  public static func removeCacheIfNeeded(files: [String]) {
    if let docPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
      let paths = files.map{ docPath.appending($0) }
      let manager = FileManager.default
      paths.forEach({ (path) in
        if manager.fileExists(atPath: path) {
          do {
            try manager.removeItem(at: URL(fileURLWithPath: path))
          } catch let err {
            print(err)
          }
        }
      })
    }
  }

  /// Moving all contents of the given folder to a specific folder in document directory
  /// Automatical create folder in directory if the destination did not exist
  ///
  /// - Parameters:
  ///   - folder: target folder in bundle
  ///   - dest: the destination
  public static func moveFolderToDocument(folder: String, dest: String) {
    Thread.onBackground {
      let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      if var path = directoryURLs.first {
        do {
          path.appendPathComponent(folder)
          if !FileManager.default.fileExists(atPath: path.path) {
            try FileManager.default.createDirectory(atPath: path.path, withIntermediateDirectories: false, attributes: nil)
          }
          /// Start moving assets in bundle to created folder in document directory
          if let bundle = Bundle.main.resourceURL?.appendingPathComponent(dest) {
            let contents = try FileManager.default.contentsOfDirectory(atPath: bundle.path)
            contents.forEach({ (named) in
              let docPath = path.appendingPathComponent(named)
              let bundlePath = bundle.appendingPathComponent(named)
              if !FileManager.default.fileExists(atPath: docPath.path) {
                do {
                  try FileManager.default.copyItem(at: bundlePath, to: docPath)
                } catch let err {
                  Service.log.debug(err)
                }
              }
            })
          }
        } catch let err {
          Service.log.debug(err)
        }
      }
    }
  }

  /// Store a list of data with name in local storage
  ///
  /// - Parameters:
  ///   - datas: list of given data and its name
  public static func cachingInStorage(datas: [(Data, String)]) {
    if let docPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
      let paths = datas.map { ($0.0, docPath.appending($0.1)) }
      paths.forEach({ (data, path) in
        do {
          if !FileManager.default.fileExists(atPath: path) {
            try data.write(to: URL(fileURLWithPath: path))
          }
        } catch let err {
          Service.log.debug(err)
        }
      })
    }
  }

  /// Store json with a specific filename in local storage
  ///
  /// - Parameter json: target json
  /// - Parameter filename: name of written file in local storage
  public static func storeData(data: Data, filename: String) {
    if let docPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
      let filepath = docPath.appending(filename)
      /// Removing old one if exists
      if FileManager.default.fileExists(atPath: filepath) {
        do {
          try FileManager.default.removeItem(atPath: filepath)
        } catch let err {
          Service.log.debug(err)
        }
      }
      /// Start writing new one
      do {
        try data.write(to: URL(fileURLWithPath: filepath))
      } catch let err {
        Service.log.debug(err)
      }
    }
  }

  /// Retrieving file from local storage and converting to json if having one
  ///
  /// - Returns: nil if no one
  public static func retrieve(filename: String) -> Data? {
    if let docPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
      let filepath = docPath.appending(filename)
      if FileManager.default.fileExists(atPath: filepath) {
        do {
          let data = try Data(contentsOf: URL(fileURLWithPath: filepath))
          return data
        } catch let err {
          Service.log.debug(err)
        }
      }
    }
    return nil
  }
}
