//
//  SampleData.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import UIKit

protocol Samplable {
    associatedtype Item
    static var sample: Item { get }
    static var samples: [Item] { get }
}

extension Date {
    static var random: Date {
        return Date(timeIntervalSince1970: 50 * 365 * 24 * 3600 + Double.random(in: 0..<(3600 * 24 * 365)))
    }
}

// MARK: - AppState
extension AppState: Samplable {
    static var samples: [AppState] { [sample, sample2, sample3] }
    static var sample: AppState { AppState() }
    static var sample2: AppState { AppState() }
    static var sample3: AppState { AppState() }
}

// MARK: - Mamber
extension Member {
    convenience init(_ member: Member) {
        self.init()
        userName = member.userName
        membershipStatus = member.membershipStatus
    }
}

extension Member: Samplable {
    static var samples: [Member] { [sample, sample2, sample3] }
    static var sample: Member { Member(userName: "Tim", state: .active) }
    static var sample2: Member { Member(userName: "Tom", state: .active) }
    static var sample3: Member { Member(userName: "Tin", state: .pending) }
}

// MARK: - Chatster
extension Chatster {
    convenience init(user: User) {
        self.init()
        id = user.id
        userName = user.userName
        displayName = user.userPreference!.displayName
        avatarImage = Photo(user.userPreference?.avatarImage)
        lastSeenAt = Date.random
        presence = user.presence
    }
}

extension Chatster: Samplable {
    static var samples: [Chatster] { [.sample, .sample2, .sample3] }
    static var sample: Chatster { Chatster(user: .sample) }
    static var sample2: Chatster { Chatster(user: .sample2) }
    static var sample3: Chatster { Chatster(user: .sample3) }
}

// MARK: - Conversation
extension Conversation {
    convenience init(displayName: String, unreadCount: Int, members: [Member]) {
        self.init()
        self.displayName = displayName
        self.unreadCount = unreadCount
        self.members.append(objectsIn: members.map { Member($0) })
    }
}

extension Conversation: Samplable {
    static var samples: [Conversation] { [sample, sample2, sample3] }
    static var sample: Conversation { Conversation(displayName: "Tim", unreadCount: 2, members: Member.samples) }
    static var sample2: Conversation { Conversation(displayName: "Tom", unreadCount: 0, members: Member.samples) }
    static var sample3: Conversation { Conversation(displayName: "Tin", unreadCount: 1, members: Member.samples) }
}
// MARK: - UserPreference
extension UserPreference {
    convenience init(displayName: String, photo: Photo) {
        self.init()
        self.displayName = displayName
        avatarImage = photo
    }
}

extension UserPreference: Samplable {
    static var samples: [UserPreference] { [sample, sample2, sample3] }
    static var sample: UserPreference { UserPreference(displayName: "Tim", photo: .sample) }
    static var sample2: UserPreference { UserPreference(displayName: "Tom", photo: .sample2) }
    static var sample3: UserPreference { UserPreference(displayName: "Tin", photo: .sample3) }
}

// MARK: - Photo
extension Photo {
    convenience init(photoName: String) {
        self.init()
        thumbNail = (UIImage(named: photoName) ?? UIImage()).jpegData(compressionQuality: 0.8)
        picture = (UIImage(named: photoName) ?? UIImage()).jpegData(compressionQuality: 0.8)
        self.date = Date.random
    }

    convenience init(_ photo: Photo?) {
        self.init()
        if let photo {
            thumbNail = photo.thumbNail
            picture = photo.picture
            date = photo.date
        }
    }
}

extension Photo: Samplable {
    static var samples: [Photo] { [sample, sample2, sample3] }
    static var sample: Photo { Photo(photoName: "Tim") }
    static var sample2: Photo { Photo(photoName: "Tom") }
    static var sample3: Photo { Photo(photoName: "Tin") }
    static var spud: Photo { Photo(photoName: "spud\(Int.random(in: 1...8))")}
}

// MARK: - User
extension User {
    convenience init(userName: String,
                     presence: Presence,
                     userPreference: UserPreference,
                     conversations: [Conversation]) {
        self.init()
        partition = "user=\(id)"
        self.userName = userName
        self.presence = presence.rawValue
        self.userPreference = userPreference
        self.lastSeenAt = Date.random
        conversations.forEach { conversation in
            self.conversations.append(conversation)
        }
    }
}

extension User: Samplable {
    static var samples: [User] { [.sample, .sample2, .sample3] }
    static var sample: User { User(userName: "tim@sample.com",
                                   presence: .onLine,
                                   userPreference: .sample,
                                   conversations: [.sample, .sample2, .sample3]) }
    static var sample2: User { User(userName: "tom@sample.com",
                                    presence: .offLine,
                                    userPreference: .sample,
                                    conversations: [.sample, .sample2]) }
    static var sample3: User { User(userName: "tin@sample.com",
                                    presence: .hidden,
                                    userPreference: .sample,
                                    conversations: [.sample, .sample3])}
}

// MARK: - ChatMessage
extension ChatMessage {
    convenience init(conversation: Conversation,
                     author: User,
                     text: String = "This is the text for the message",
                     includePhoto: Bool = false,
                     includeLocation: Bool = false) {
        self.init()
        partition = "conversation=\(conversation.id)"
        self.author = author.userName
        self.text = text
        if includePhoto { self.image = Photo.spud }
        self.timestamp = Date.random
        if includeLocation {
            self.location.append(-0.187236861712 + Double.random(in: -10..<10))
            self.location.append(50.298349187291 + Double.random(in: -10..<10))
        }
    }
}

extension ChatMessage: Samplable {
    static var samples: [ChatMessage] { [.sample, .sample2, .sample3] }
    static var sample: ChatMessage { ChatMessage(conversation: .sample, author: .sample)}
    static var sample2: ChatMessage { ChatMessage(conversation: .sample2, author: .sample2, includePhoto: true)}
    static var sample3: ChatMessage { ChatMessage(conversation: .sample3, author: .sample3, includeLocation: true)}
}
