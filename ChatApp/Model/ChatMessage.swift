//
//  ChatMessage.swift
//  ChatApp
//
//  Created by wyn on 2023/4/6.
//

import Foundation
import RealmSwift

class ChatMessage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var partition = ""
    @Persisted var author: String?
    @Persisted var text = ""
    @Persisted var image: Photo?
    @Persisted var location = List<Double>()
    @Persisted var timestamp = Date()

    override static func primaryKey() -> String? {
        return "_id"
    }

    convenience init(author: String, text: String, image: Photo?, location: [Double]) {
        self.init()
        self.author = author
        self.text = text
        self.image = image
        location.forEach { coord in
            self.location.append(coord)
        }
    }

    var conversationID: String {
        get { partition.components(separatedBy: "=")[1] }
        set(conversation) { partition = "conversation=\(conversation)" }
    }
}
