//
//  SetUserProfileView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/5.
//

import SwiftUI
import RealmSwift

struct SetUserProfileView: View {
    @AppStorage("shouldShareLocation") var shouldShareLocation = false
    @ObservedRealmObject var user: User
    @Binding var isPresented: Bool
    @Binding var userID: String?

    @State private var displayName = ""
    @State private var photo: Photo?
    @State private var photoAdded = false
    // TODO: SetUserProfileView
    var body: some View {
        Form {
            Section(header: Text("User Profile")) {
                if let photo {
                    AvatarButton(photo: photo) {
                        showPhotoTaker()
                    }
                }
                if photo == nil {
                    Button(action: { showPhotoTaker() }) {
                        Text("Add photo")
                    }
                }
            }
        }
    }
    private func showPhotoTaker() {
        
    }
}

//struct SetUserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetUserProfileView()
//    }
//}
