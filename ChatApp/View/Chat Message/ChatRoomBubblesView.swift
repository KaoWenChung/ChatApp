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
                ScrollViewReader { (proxy: ScrollViewProxy) in
                    VStack {
                        ForEach(chats) { chatMessage in
                            ChatBubbleView(chatMessage: chatMessage,
                                           authorName: chatMessage.author != user.userName ? chatMessage.author : nil,
                                           isPreview: isPreview)
                        }
                    }
                    .onAppear {
                        scrollToBottom()
                        withAnimation(.linear(duration: 0.2)) {
                            proxy.scrollTo(latestChatID, anchor: .bottom)
                        }
                    }
                    .onChange(of: latestChatID) { target in
                        withAnimation {
                            proxy.scrollTo(target, anchor: .bottom)
                        }
                    }
                }
            }
            Spacer()
            if isPreview {
                ChatInputBox(user: user, send: sendMessage, focusAction: scrollToBottom)
            } else {
                ChatInputBox(user: user, send: sendMessage, focusAction: scrollToBottom)
                    .environment(\.realmConfiguration,
                                  app.currentUser!.configuration(partitionValue: "user=\(user.id)"))
            }
        }
        .navigationBarTitle(conversation?.displayName ?? "Chat", displayMode: .inline)
        .padding(.horizontal, Dimensions.padding)
        .onAppear { loadChatRoom() }
        .onDisappear { closeChatRoom() }
    }

    private func scrollToBottom() {
        latestChatID = chats.last?.id ?? ""
    }

    private func loadChatRoom() {
        scrollToBottom()
        realmChatsNotificationToken = chats.thaw()?.observe { _ in
            scrollToBottom()
        }
    }

    private func closeChatRoom() {
        if let token = realmChatsNotificationToken {
            token.invalidate()
        }
    }

    private func sendMessage(_ message: ChatMessage) {
        guard let conversationString = conversation else {
            return
        }
        message.conversationID = conversationString.id
        $chats.append(message)
    }
}

struct ChatRoomBubblesView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomBubblesView(user: .sample, isPreview: true)
            .environmentObject(AppState.sample)
    }
}
