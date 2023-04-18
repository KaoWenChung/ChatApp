//
//  ContentView.swift
//  ChatApp
//
//  Created by wyn on 2023/3/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var state: AppState

    @AppStorage("shouldRemindOnlineUser") var shouldRemindOnlineUser = false
    @AppStorage("onlineUserReminderHours") var onlineUserReminderHours = 8.0

    @State private var userID: String?

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if state.loggedIn && userID != nil {
                        LoggedInView(userID: $userID)
                            .environment(\.realmConfiguration, app.currentUser!
                                .configuration(partitionValue: "user=\(userID ?? "Unknown")"))
                    } else {
                        LoginView(userID: $userID)
                    }
                    Spacer()
                    if let error = state.error {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    }
                    if state.busyCount > 0 {
                        OpaqueProgressView("Working with Realm")
                    }
                }
            }
            .currentDeviceNavigationViewStyle(alwaysStacked: !state.loggedIn)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                if shouldRemindOnlineUser {
                    addNotification(timeInHours: Int(onlineUserReminderHours))
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                clearNotifications()
            }
        }
    }

    func addNotification(timeInHours: Int) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Still logged in"
            let unit = "\(onlineUserReminderHours) \(onlineUserReminderHours == 1 ? "hour" : "hours")"
            content.subtitle = "You've been offline in the background for" + unit
            content.sound = .default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: onlineUserReminderHours * 3600,
                                                            repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString,
                                                content: content,
                                                trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { setting in
            if setting.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, _ in
                    if success {
                        addRequest()
                    }
                }
            }
        }
    }

    func clearNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
