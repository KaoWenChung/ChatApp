//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by wyn on 2023/3/1.
//

import Foundation

final class MessageViewModel {
    private(set) var messageList = [ChatBubble(type: .rightOthers, content: "conent", userName: "Mike"),
                                    ChatBubble(type: .rightFirst, content: "conentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconent", userName: "Mike"),
                                    ChatBubble(type: .leftOthers, content: "conentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconent", userName: "Jay"),
                                    ChatBubble(type: .leftFirst, content: "conentconentconent", userName: "Jay")]
    func appendMessage(_ message: String) {
        messageList.append(ChatBubble(type: .rightFirst, content: message, userName: "Mike"))
    }
}
