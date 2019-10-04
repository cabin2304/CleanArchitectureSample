//
//  NotificationService.swift
//  ServiceKit
//

import UIKit
import UserNotifications

public struct NotificationService {
  
  private static let RegisteredKey = "NotificationServiceRegistered"
  
  public static func registerPNS(with didFinishNoti: Notification.Name) {
    /// Go away if unacceptable
    guard NotificationService.shouldRegister() else { return }
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ granted, _  in
      if granted {
        /// Perform register for remote noti on main thread after granted
        Thread.onMain {
          UIApplication.shared.registerForRemoteNotifications()
        }
      } else {
        /// Inform listener that author completed without granted permission
        NotificationCenter.default.post(name: didFinishNoti, object: nil)
      }
    }
  }
  
  /// Check to ignore PNS register if it's unacceptable at this time
  public static func shouldRegister() -> Bool {
    let stt = UserDefaults.standard.value(forKey: NotificationService.RegisteredKey)
    return stt as? Bool ?? true
  }
  
  public static func markRegistered(status: Bool = true) {
    UserDefaults.standard.set(status, forKey: NotificationService.RegisteredKey)
  }
  
  public static func fireLocalNoti(msg: String, info: [String: Any] = [:], scheduler: TimeInterval = 0.5) {
    let content = UNMutableNotificationContent()
    content.body = msg
    content.sound = .default
    content.userInfo = info

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: scheduler, repeats: false)
    /// Fire a local notification
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request) { (err) in
      if let error = err {
        /// Just log error
        print(error.localizedDescription)
      }
    }
  }
}
