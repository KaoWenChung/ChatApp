//
//  LoggedInView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/2.
//

import SwiftUI
import RealmSwift

struct LoggedInView: View {
    @EnvironmentObject var state: AppState

    @ObservedResults(User.self) var users
    @Binding var userID: String?

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView(userID: .constant("Owen"))
    }
}
