//
//  CameraButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/13.
//

import SwiftUI

struct CameraButton: View {
    let action: () -> Void
    var active = true

    var body: some View {
        ButtonTemplate(action: action,
                       active: active,
                       activeImage: "camera.fill",
                       inactiveImage: "camera")
    }
}

struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CameraButton(action: {}, active: true)
            CameraButton(action: {})
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
