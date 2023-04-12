//
//  ButtonTemplate.swift
//  ChatApp
//
//  Created by wyn on 2023/4/12.
//

import SwiftUI

struct ButtonTemplate: View {
    let action: () -> Void
    var active = true
    var activeImage = "paperplane.fill"
    var inactiveImage = "paperplane"
    var padding: CGFloat = 4

    private enum Dimensions {
        static let buttonSize: CGFloat = 60
        static let activeOpacity: CGFloat = 0.8
        static let disableOpacity: CGFloat = 0.2
    }

    var body: some View {
        Button(action: { if active { action() }}) {
            Image(systemName: active ? activeImage : inactiveImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.primary)
                .opacity(active ? Dimensions.activeOpacity : Dimensions.disableOpacity)
                .padding(padding)
        }
        
    }
}

struct ButtonTemplate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonTemplate(action: {})
            ButtonTemplate(action: {}, active: false)
            ButtonTemplate(action: {}, active: false, activeImage: "")
            ButtonTemplate(action: {}, active: true, activeImage: "camera.fill", inactiveImage: "camera")
        }
        .previewLayout(.sizeThatFits)
    }
}
