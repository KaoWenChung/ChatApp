//
//  NewConversationView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/16.
//

import SwiftUI
import RealmSwift

struct NewConversationView: View {
    @EnvironmentObject var state: AppState
    @Environment(\.presentationMode) var presentationMode
    @ObservedResults(Chatster.self) var chatsters

    @ObservedRealmObject var user: User

    var isPreview = false

    @State private var name = ""
    @State private var members = [String]()
    @State private var candidateMember = ""
    @State private var candidateMembers = [String]()

    private var isPrivate: Bool {
        !(name != "" && !members.isEmpty)
    }

    private var memberList: [String] {
        candidateMember == "" ? chatsters.compactMap {
            user.userName != $0.userName && !members.contains($0.userName) ? $0.userName : nil } : candidateMembers
    }

    var body: some View {
        let searchBinding = Binding<String>(
            get: { candidateMember },
            set: {
                candidateMember = $0
                searchUsers()
            }
        )
        return NavigationView {
            ZStack {
                VStack {
                    InputField(title: "Chat Name", text: $name)
                    CaptionLabel(title: "Add members")
                    SearchBox(searchText: searchBinding)
                }
            }
        }
    }
    private func searchUsers() {
        
    }
}

//struct NewConversationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewConversationView()
//    }
//}
