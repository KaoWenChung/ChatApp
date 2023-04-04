//
//  Conversation.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import Foundation
import RealmSwift

final class Conversation: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var id = UUID().uuidString
    @Persisted var displayName = ""
    @Persisted var unreadCount = 0
    @Persisted var members = List<Member>()
}
