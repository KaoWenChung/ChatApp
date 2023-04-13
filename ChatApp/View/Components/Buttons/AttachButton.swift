//
//  AttachButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/13.
//

import SwiftUI

struct AttachButton: View {
    let action: () -> Void
    var active = true

    var body: some View {
        ButtonTemplate(action: action,
                       active: active,
                       activeImage: "paperclip",
                       inactiveImage: "paperclip")
    }
}

struct AttachButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AttachButton(action: {}, active: true)
            AttachButton(action: {})
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
