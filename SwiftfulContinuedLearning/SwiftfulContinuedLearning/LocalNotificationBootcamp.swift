//
//  LocalNotificationBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 30/05/25.
//

import SwiftUI
import UserNotifications

/// Class NotificationManager is a Singleton responsible for manager LocalNotification in our App.
class NotificationManager {
    
    // MARK: PROPERTIES
    private init() {}
    static let instance = NotificationManager() // Singleton
    
    // MARK: FUNCTIONS
    
    /// Request authorization to notification via singleton instance.
    ///
    /// Performs request to notification using a singleton pattern.
    ///
    /// ```
    ///     requestAuthorization()
    /// ```
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCESS: \(granted)")
            }
        }
    }
    
    /// Schedule notification by using UNMutableNotificationContent.
    ///
    /// Schedules notification by using UNMutableNotificationContent.
    ///
    /// ```
    ///     scheduleNotification(type: .success)
    /// ```
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This wass soooo nice."
        content.sound = .default
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // calendar
        // location
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

/// Struct used to training how to create  Local Notifications.
struct LocalNotificationBootcamp: View {
    // MARK: BODY
    var body: some View {
        VStack(spacing: 12) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotification()
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    LocalNotificationBootcamp()
}
