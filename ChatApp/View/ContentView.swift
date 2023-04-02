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
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
