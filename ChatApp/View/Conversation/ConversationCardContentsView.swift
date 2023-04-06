//
//  ConversationCardContentsView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/5.
//

import SwiftUI
import RealmSwift

struct ConversationCardContentsView: View {
    @ObservedResults(Chatster.self) var chatsters

    let conversation: Conversation

    private enum Dimensions {
        static let mugWidth: CGFloat = 110
        static let cornerRadius: CGFloat = 5
        static let lineWidth: CGFloat = 1
        static let padding: CGFloat = 5
    }

    var chatMembers: [Chatster] {
        var chatsterList = [Chatster]()
        for member in conversation.members {
            chatsterList.append(contentsOf: chatsters.filter("userName = %@", member.userName))
        }
        return chatsterList
    }

    // TODO: ConversationCardContentView
    var body: some View {
        HStack {
        }
    }
}

//struct ConversationCardContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCardContentView()
//    }
//}
