//
//  ChatRoomBubblesView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/6.
//

import RealmSwift
import SwiftUI

struct ChatRoomBubblesView: View {
    @ObservedResults(ChatMessage.self, sortDescriptor: SortDescriptor(keyPath: "timestamp", ascending: true)) var chats

    @ObservedRealmObject var user: User
    var conversation: Conversation?
    var isPreview = false

    @State private var realmChatsNotificationToken: NotificationToken?
    @State private var latestChatID = ""

    private enum Dimensions {
        static let padding: CGFloat = 8
    }

    var body: some View {
        VStack {
            ScrollView(.vertical) {
//                ScrollViewReader { (proxy: ScrollViewProxy) in
//                    VStack {
//                        ForEach(chats) { chatMessage in
//                            ChatBubble
//                        }
//                    }
//                }
            }
        }
        
    }
}

struct ChatRoomBubblesView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomBubblesView(user: .sample, isPreview: true)
        // TODO: Add environmentObject
    }
}

