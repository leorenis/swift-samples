//
//  LocalNotificationBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 30/05/25.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    private init() {}
    static let instance = NotificationManager() // Singleton
    
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
