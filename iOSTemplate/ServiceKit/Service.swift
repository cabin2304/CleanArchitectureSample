//
//  Service.swift
//  ServiceKit
//

import Foundation
import SwiftyBeaver

public struct Service {
  
  public static let log = SwiftyBeaver.self
  
  public static func configSwiftyBeaver() {
    // Log to Xcode Console
    let console = ConsoleDestination()
    // Log to default swiftybeaver.log file
    let file = FileDestination()

    // Use custom format and set console output to short time, log lever and message
    console.format = "$DHH:mm:ss$d $L $M"

    // Add the destinations to SwiftyBeaver
    Service.log.addDestination(console)
    Service.log.addDestination(file)
  }
}
