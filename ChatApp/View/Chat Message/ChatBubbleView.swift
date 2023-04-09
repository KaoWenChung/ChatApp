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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct ChatBubbleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatBubbleView(chatMessage: .sample, authorName: <#T##String?#>)
//    }
//}
