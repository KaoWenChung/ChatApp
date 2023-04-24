//
//  MarkDown.swift
//  ChatApp
//
//  Created by wyn on 2023/4/24.
//

import SwiftUI

struct MarkDown: View {
    let text: String

    var body: some View {
        Text(safeAttributedString(text))
    }
}

private func safeAttributedString(_ sourceString: String) -> AttributedString {
    do {
        return try AttributedString(markdown: sourceString)
    } catch {
        return AttributedString(stringLiteral: "Text could not be render")
    }
}

struct MarkDown_Previews: PreviewProvider {
    static var previews: some View {
        MarkDown(text: "Sample of *italics*, **bold**, ~~strikethrough~~, [link](https://mock.com)")
    }
}
