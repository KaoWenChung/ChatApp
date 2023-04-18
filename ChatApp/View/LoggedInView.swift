//
//  LoggedInView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/2.
//

import SwiftUI
import RealmSwift

struct LoggedInView: View {
    @EnvironmentObject var state: AppState

    @ObservedResults(User.self) var users
    @Binding var userID: String?

    @State var showingProfileView = false

    var body: some View {
        ZStack {
            if let user = users.first {
                if showingProfileView {
                    SetUserProfileView(user: user, isPresented: $showingProfileView, userID: $userID)
                } else {
                    ConversationListView(user: user)
                        .navigationBarItems(trailing: state.loggedIn && !state.shouldIndicateActivity ?
                                            UserAvatarView(photo: user.userPreference?.avatarImage,
                                                           online: true) {
                            showingProfileView.toggle()
                        } : nil)
                }
            }
        }
        .navigationBarTitle("Charts", displayMode: .inline)
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView(userID: .constant("Owen"))
    }
}
