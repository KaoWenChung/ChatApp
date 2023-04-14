//
//  OnlineAlertSettings.swift
//  ChatApp
//
//  Created by wyn on 2023/4/15.
//

import SwiftUI

struct OnlineAlertSettings: View {
    @EnvironmentObject var state: AppState

    @AppStorage("shouldRemindOnlineUser") var shouldRemindOnlineUser = false
    @AppStorage("onlineUserReminderHours") var onlineUserReminderHours = 8.0

    var body: some View {
        VStack {
            Toggle(isOn: $shouldRemindOnlineUser, label: {
                Text("on-line reminder")
            })
            .onChange(of: shouldRemindOnlineUser, perform: { value in
                if value {
                    let notificationCenter = UNUserNotificationCenter.current()
                    notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if !success {
                            shouldRemindOnlineUser = false
                        }
                        if let error {
                            state.error = "Failed to enable notification: \(error.localizedDescription)"
                        }
                    }
                }
            })
            if shouldRemindOnlineUser {
                Slider(value: $onlineUserReminderHours, in: 1...24, step: 1)
                Text("Minimized alert in " +
                     "\(Int(onlineUserReminderHours)) \(onlineUserReminderHours == 1 ? "hour" : "hours")")
            }
        }
    }
}

struct OnlineAlertSettings_Previews: PreviewProvider {
    static var previews: some View {
        OnlineAlertSettings()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
