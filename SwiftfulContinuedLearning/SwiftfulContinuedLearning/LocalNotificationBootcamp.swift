//
//  LocalNotificationBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 30/05/25.
//

import SwiftUI
import UserNotifications
import CoreLocation

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
    ///     scheduleNotification()
    /// ```
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This wass soooo nice."
        content.sound = .default
        content.badge = 1
        
        /**
         * There are three ways to trigger.
         * 1. Time   |   2. Calendar   |   3. Location
         */
        
        // 1. Time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // 2. Calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 12
//        dateComponents.minute = 08
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // 3. Location
//        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
//        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    /// Restore badge count.
    ///
    /// Restores badge count on the app icon.
    ///
    /// ```
    ///     notificationBadgeRestore()
    /// ```
    func notificationBadgeRestore() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
    
    /// Cancel all schedule notifications.
    ///
    /// Performs schedule cancelation from notifications.
    ///
    /// ```
    ///     cancelNotification()
    /// ```
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
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
            Button("Cancel notifications") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear {
            NotificationManager.instance.notificationBadgeRestore()
        }
    }
}

// MARK: PREVIEW
#Preview {
    LocalNotificationBootcamp()
}
