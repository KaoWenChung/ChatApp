//
//  LogoutButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import SwiftUI
import RealmSwift

struct LogoutButton: View {
    @EnvironmentObject var state: AppState
    @ObservedRealmObject var user: User
    @Binding var userID: String?
    var action: () -> Void = {}

    @State private var isConfirming = false

    var body: some View {
        Button("Log Out") { isConfirming = true }
            .confirmationDialog("Are you going to lout out?", isPresented: $isConfirming) {
                Button("Confirm Logout", role: .destructive, action: logout)
                Button("Cancel", role: .cancel) {}
            }
            .disabled(state.shouldIndicateActivity)
    }

    private func logout() {
        state.shouldIndicateActivity = true
        action()
        $user.presenceState.wrappedValue = .offLine
        app.currentUser?.logOut { _ in
            DispatchQueue.main.async {
                state.shouldIndicateActivity = false
            }
        }
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton(user: User(), userID: .constant("Mike"))
            .environmentObject(AppState())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
