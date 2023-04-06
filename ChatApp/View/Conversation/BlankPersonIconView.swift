//
//  BlankPersonIconView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/6.
//

import SwiftUI

struct BlankPersonIconView: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .foregroundColor(.gray)
    }
}

struct BlankPersonIconView_Previews: PreviewProvider {
    static var previews: some View {
        BlankPersonIconView()
            .frame(width: 50, height: 50)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
