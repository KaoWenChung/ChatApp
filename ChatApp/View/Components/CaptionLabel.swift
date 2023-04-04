//
//  CaptionLabel.swift
//  ChatApp
//
//  Created by wyn on 2023/4/4.
//

import SwiftUI

struct CaptionLabel: View {
    var title: String

    private let linelimit = 5
    var body: some View {
        HStack {
            Text(LocalizedStringKey(title))
                .font(.caption)
                .lineLimit(linelimit)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct CaptionLabel_Previews: PreviewProvider {
    static var previews: some View {
        CaptionLabel(title: "Mike")
    }
}
