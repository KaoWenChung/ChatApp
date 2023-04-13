//
//  SendButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/13.
//

import SwiftUI

struct SendButton: View {
    let action: () -> Void
    var active = true

    var body: some View {
        ButtonTemplate(action: action,
                       active: active,
                       activeImage: "paperplane.fill",
                       inactiveImage: "paperplane")
    }
}

struct SendButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SendButton(action: {}, active: true)
            SendButton(action: {})
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
