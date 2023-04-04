//
//  UserPreference.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import RealmSwift

final class UserPreference: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var displayName: String?
    @Persisted var avatarImage: Photo?

    var isEmpty: Bool { displayName == nil || displayName == "" }
}
