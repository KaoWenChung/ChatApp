//
//  Chatster.swift
//  ChatApp
//
//  Created by wyn on 2023/4/5.
//

import Foundation
import RealmSwift

final class Chatster: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var partition = "all-users=all-the-users"
    @Persisted var userName = ""
    @Persisted var displayName: String?
    @Persisted var avatarImage: Photo?
    @Persisted var lastSeenAt: Date?
    @Persisted var presence = "Off-Line"

    var presenceState: Presence {
        get { return Presence(rawValue: presence) ?? .hidden }
        set { presence = newValue.rawValue }
    }
}
