//
//  ConversationListView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import SwiftUI
import RealmSwift

struct ConversationListView: View {
    @EnvironmentObject var state: AppState
    @ObservedRealmObject var user: User

    var isPreview = false

    @State private var conversation: Conversation?
    @State private var showConversation = false
    @State private var showingAddChat = false

    private let sortDescriptors = [
        SortDescriptor(keyPath: "unreadCount", ascending: false),
        SortDescriptor(keyPath: "displayName", ascending: true)
    ]

    var body: some View {
        ZStack {
            VStack {
                if let conversations = user.conversations.sorted(by: sortDescriptors) {
                    List {
//                        ForEach(conversations) { conversation in
//                            Button(action: {
//                                self.conversation = conversation
//                                showConversation.toggle()
//                            }) {
//                                ConversationCardView
//                            }
//                        }
                    }
                }
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView(user: .sample)
    }
}
