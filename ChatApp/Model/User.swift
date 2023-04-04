//
//  User.swift
//  ChatApp
//
//  Created by wyn on 2023/4/2.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var partition = "" // "user=_id"
    @Persisted var userName = ""
    @Persisted var lastSeenAt: Date?
    @Persisted var presence = "On-Line"

    var presenceState: Presence {
        get { return Presence(rawValue: presence) ?? .hidden }
        set { presence = newValue.asString }
    }

    convenience init(userName: String, id: String) {
        self.init()
        self.userName = userName
        self.id = id
        partition = "user=\(id)"
        presence = "On-Line"
    }
}

enum Presence: String {
    case onLine = "On-Line"
    case offLine = "Off-Line"
    case hidden = "Hidden"

    var asString: String {
        self.rawValue
    }
}
