//
//  ConversationCardView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/5.
//

import SwiftUI
import RealmSwift

struct ConversationCardView: View {
    let conversation: Conversation
    var isPreview = false

    var body: some View {
        VStack {
            if isPreview {
                ConversationCardContentsView(conversation: conversation)
            } else {
                ConversationCardContentsView(conversation: conversation)
                    .environment(\.realmConfiguration,
                                  app.currentUser!.configuration(partitionValue: "all-users=all-the-users"))
            }
        }
    }
}

struct ConversationCardView_Previews: PreviewProvider {
    static var previews: some View {
        Realm.bootstrap()

        return ConversationCardView(conversation: .sample, isPreview: true)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
