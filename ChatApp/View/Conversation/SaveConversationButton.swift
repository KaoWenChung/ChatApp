//
//  SaveConversationButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/16.
//

import SwiftUI
import RealmSwift

struct SaveConversationButton: View {
    @EnvironmentObject var state: AppState

    @ObservedRealmObject var user: User

    let name: String
    let members: [String]
    var done: () -> Void = {}

    var body: some View {
        Button(action: saveConversation) {
            Text("Save")
        }
    }

    private func saveConversation() {
        state.error = nil
        let conversation = Conversation()
        conversation.displayName = name
        conversation.members.append(Member(userName: user.userName, state: .active))
        conversation.members.append(objectsIn: members.map { Member($0) })
        $user.conversations.append(conversation)
        done()
    }
}

struct SaveConversationButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveConversationButton(user: .sample, name: "Example Conversation", members: ["tim@mock.com", "tom@mock.com", "tin@mock.com"])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
