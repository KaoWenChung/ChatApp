//
//  BackButton.swift
//  ChatApp
//
//  Created by wyn on 2023/4/14.
//

import SwiftUI

struct BackButton: View {
    var label = "Back"

    private let spacing: CGFloat = 8

    var body: some View {
        HStack(spacing: spacing) {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
            Text(label)
        }
    }
}

struct BackButotn_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(label: "Hello")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
