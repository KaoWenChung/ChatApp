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

    private var isEmpty: Bool {
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
                    List {
                        ForEach(memberList, id: \.self) { candidateMember in
                            Button(action: { addMember(candidateMember) }, label: {
                                HStack {
                                    Text(candidateMember)
                                    Spacer()
                                    Image(systemName: "plus.circle.fill")
                                        .renderingMode(.original)
                                }
                            })
                        }
                    }
                    Divider()
                    CaptionLabel(title: "Members")
                    List {
                        ForEach(members, id: \.self) { member in
                            Text(member)
                        }
                        .onDelete(perform: deleteMember)
                    }
                    Spacer()
                }
                Spacer()
                if let error = state.error {
                    Text("Error: \(error)")
                        .foregroundColor(Color.red)
                }
            }
            .padding()
            .navigationBarTitle("New Chat", displayMode: .inline)
            .navigationBarItems(leading: Button("Dismiss") { presentationMode.wrappedValue.dismiss() },
                                trailing: VStack {
                if isPreview {
                    SaveConversationButton(user: user,
                                           name: name,
                                           members: members,
                                           done: { presentationMode.wrappedValue.dismiss() })
                } else {
                    SaveConversationButton(user: user,
                                           name: name,
                                           members: members,
                                           done: { presentationMode.wrappedValue.dismiss() })
                        .environment(\.realmConfiguration,
                                      app.currentUser!.configuration(partitionValue: "user=\(user.id)"))
                }
            }
                .disabled(isEmpty)
                .padding()
            )
        }
        .onAppear(perform: searchUsers)
    }

    private func addMember(_ member: String) {
        state.error = nil
        if member.contains(member) {
            state.error = "\(member) is already part of this chat"
        } else {
            members.append(member)
            candidateMember = ""
            searchUsers()
        }
    }

    private func deleteMember(at offset: IndexSet) {
        members.remove(atOffsets: offset)
    }

    private func searchUsers() {
        var candidateChatsters: Results<Chatster>
        if candidateMember == "" {
            candidateChatsters = chatsters
        } else {
            let predicate = NSPredicate(format: "userName CONTAINS[cd] %@", candidateMember)
            candidateChatsters = chatsters.filter(predicate)
        }
        candidateMembers.removeAll()
        candidateChatsters.forEach { chatster in
            if !members.contains(chatster.userName) && chatster.userName != user.userName {
                candidateMembers.append(chatster.userName)
            }
        }
    }
}

struct NewConversationView_Previews: PreviewProvider {
    static var previews: some View {
        Realm.bootstrap()

        return NewConversationView(user: .sample, isPreview: true)
            .environmentObject(AppState.sample)
    }
}
