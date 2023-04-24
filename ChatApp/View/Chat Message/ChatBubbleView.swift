//
//  ChatBubbleView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/9.
//

import SwiftUI
import RealmSwift

struct ChatBubbleView: View {
    let chatMessage: ChatMessage
    let authorName: String?
    var isPreview = false

    var isMyMessage: Bool { authorName == nil }
    private enum Dimensions {
        static let padding: CGFloat = 4
        static let horizontalOffset: CGFloat = 100
        static let cornerRadius: CGFloat = 15
    }

    var body: some View {
        HStack {
            if isMyMessage { Spacer().frame(width: Dimensions.horizontalOffset) }
            VStack {
                HStack {
                    if let authorName {
                        if isPreview {
                            AuthorView(userName: authorName)
                        } else {
                            AuthorView(userName: authorName)
                                .environment(\.realmConfiguration,
                                              app.currentUser!.configuration(partitionValue: "all-users=all-the-users"))
                        }
                    }
                    Spacer()
                    TextDate(date: chatMessage.timestamp)
                }
                HStack {
                    if let photo = chatMessage.image {
                        ThumbnailWithExpand(photo: photo)
                            .padding(Dimensions.padding)
                    }
                    if let location = chatMessage.location {
                        if location.count == 2 {
                            // TODO: MapThumbnailWithExpand
                        }
                    }
                    if chatMessage.text != "" {
                        MarkDown(text: chatMessage.text)
                            .padding(Dimensions.padding)
                    }
                    Spacer()
                }
            }
            .padding(Dimensions.padding)
            .background(Color(isMyMessage ? "MyBubble" : "OtherBubble"))
            .clipShape(RoundedRectangle(cornerRadius: Dimensions.cornerRadius))
            if !isMyMessage { Spacer().frame(width: Dimensions.horizontalOffset) }
        }
    }
}

struct ChatBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        Realm.bootstrap()

        return Group {
            ChatBubbleView(chatMessage: .sample, authorName: "Tim", isPreview: true)
            ChatBubbleView(chatMessage: .sample2, authorName: "Tom", isPreview: true)
            ChatBubbleView(chatMessage: .sample, authorName: nil, isPreview: true)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
