//
//  ChatInputBox.swift
//  ChatApp
//
//  Created by wyn on 2023/4/12.
//

import SwiftUI
import RealmSwift

struct ChatInputBox: View {
    @AppStorage("shouldShareLocation") var shouldShareLocation = false

    @ObservedRealmObject var user: User
    var send: (_: ChatMessage) -> Void = { _ in }
    var focusAction: () -> Void = {}

    @FocusState var isTextFocused: Bool

    private enum Dimensions {
        static let maxHeight: CGFloat = 100
        static let minHeight: CGFloat = 100
        static let radius: CGFloat = 10
        static let imageSize: CGFloat = 70
        static let padding: CGFloat = 15
        static let toolStripHeight: CGFloat = 35
    }

    @State var photo: Photo?
    @State var chatText = ""
    @State var location = [Double]()

    private var isEmpty: Bool { photo == nil && location == [] && chatText == "" }
    var body: some View {
        VStack {
            if let photo {
                ThumbnailWithDelete(photo: photo, action: deletePhoto)
            }
            if location.count == 2 {
                MapThumbnailWithDelete(location: location, action: deleteMap)
            }
            TextEditor(text: $chatText)
                .onTapGesture(perform: focusAction)
                .focused($isTextFocused)
                .padding(Dimensions.padding)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: Dimensions.minHeight, maxHeight: Dimensions.maxHeight)
                .background(Color("GreenBackground"))
                .clipShape(RoundedRectangle(cornerRadius: Dimensions.radius))
        }
        HStack {
            Spacer()
            // TODO: Buttons
        }
    }

    private func deletePhoto() {
        photo = nil
    }

    private func deleteMap() {
        location.removeAll()
    }
}

//struct ChatInputBox_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatInputBox()
//    }
//}
