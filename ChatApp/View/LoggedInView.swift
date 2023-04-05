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

    @State var showingProfileView = false

    var body: some View {
        ZStack {
            if let user = users.first {
                if showingProfileView {
                    
                } else {
                    
                }
            }
        }
        .navigationBarTitle("Charts", displayMode: .inline)
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView(userID: .constant("Owen"))
    }
}
