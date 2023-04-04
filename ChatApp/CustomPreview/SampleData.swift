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
}

extension Photo: Samplable {
    static var samples: [Photo] { [sample, sample2, sample3] }
    static var sample: Photo { Photo(photoName: "Tim") }
    static var sample2: Photo { Photo(photoName: "Tom") }
    static var sample3: Photo { Photo(photoName: "Tin") }
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
