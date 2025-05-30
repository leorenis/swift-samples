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
}

struct LocalNotificationBootcamp: View {
    // MARK: BODY
    var body: some View {
        VStack(spacing: 12) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    LocalNotificationBootcamp()
}
