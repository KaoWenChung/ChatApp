//
//  Member.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import Foundation
import RealmSwift

final class Member: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var userName = ""
    @Persisted var membershipStatus = "User added, but invite pending"

    convenience init(_ userName: String) {
        self.init()
        self.userName = userName
        membershipState = .pending
    }

    convenience init(userName: String, state: MembershipState) {
        self.init()
        self.userName = userName
        membershipState = state
    }

    var membershipState: MembershipState {
        get { return MembershipState(rawValue: membershipStatus) ?? .left}
        set { membershipStatus = newValue.rawValue }
    }
}

enum MembershipState: String {
    case pending = "User added, but invite pending"
    case invited = "User has been invited to join"
    case active = "Membership active"
    case left = "User has left"

    var asString: String {
        self.rawValue
    }
}
