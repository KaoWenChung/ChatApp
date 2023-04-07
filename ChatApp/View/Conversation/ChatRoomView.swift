//
//  ChatRoomView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/6.
//

import SwiftUI
import RealmSwift

struct ChatRoomView: View {
    @EnvironmentObject var state: AppState

    @ObservedRealmObject var user: User
    var conversation: Conversation?
    var isPreview = false

    let padding: CGFloat = 8

    var body: some View {
        if isPreview {
            
        }
    }
}

struct ChatRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(user: .sample)
    }
}
