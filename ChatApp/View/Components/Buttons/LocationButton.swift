//
//  LocationButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/13.
//

import SwiftUI

struct LocationButton: View {
    let action: () -> Void
    var active = true

    var body: some View {
        ButtonTemplate(action: action,
                       active: active,
                       activeImage: "location.fill",
                       inactiveImage: "location")
    }
}

struct LocationButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LocationButton(action: {}, active: true)
            LocationButton(action: {})
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
