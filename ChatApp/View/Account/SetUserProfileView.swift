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

    var body: some View {
        Form {
            Section(header: Text("User Profile")) {
                if let photo {
                    AvatarButton(photo: photo) {
                        showPhotoTaker()
                    }
                }
                if photo == nil {
                    Button(action: { showPhotoTaker() }, label: {
                        Text("Add photo")
                    })
                }
                InputField(title: "Display name", text: $displayName)
                CallToActionButton(title: "Save User Profile", action: saveProfile)
            }
            Section(header: Text("Device Setting")) {
                Toggle(isOn: $shouldShareLocation, label: {
                    Text("Share Location")
                })
                .onChange(of: shouldShareLocation) {_ in}
                OnlineAlertSettings()
            }
        }
        .onAppear(perform: initData)
        .navigationBarItems(
            leading: Button(action: { isPresented = false }, label: {
                BackButton()
            }),
            trailing: LogoutButton(user: user, userID: $userID, action: { isPresented = false }))
        .padding()
        .navigationBarTitle("Edit Profile", displayMode: .inline)
    }

    private func initData() {
        displayName = user.userPreference?.displayName ?? "Unknown"
        photo = user.userPreference?.avatarImage
    }

    private func showPhotoTaker() {
        PhotoCaptureController.show(source: .camera) { controller, photo in
            self.photo = photo
            photoAdded = true
            controller.hide()
        }
    }

    private func saveProfile() {
        let userPreferences = UserPreference()
        userPreferences.displayName = displayName
        if photoAdded {
            guard let newPhoto = photo else { return }
            userPreferences.avatarImage = newPhoto
        } else {
            userPreferences.avatarImage = Photo(user.userPreference?.avatarImage)
        }
        $user.userPreference.wrappedValue = userPreferences
        $user.presenceState.wrappedValue = .onLine
        isPresented.toggle()
    }
}

struct SetUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SetUserProfileView(user: User(), isPresented: .constant(true), userID: .constant("Mike"))
    }
}
