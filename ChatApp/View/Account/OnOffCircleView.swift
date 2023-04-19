//
//  OnOffCircleView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/6.
//

import SwiftUI

struct OnOffCircleView: View {
    let online: Bool

    private enum Dimensions {
        static let frameSize: CGFloat = 14.0
        static let innerCircleSize: CGFloat = 10
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(.gray)
                .frame(width: Dimensions.frameSize, height: Dimensions.frameSize)
            Circle()
                .fill(online ? .green : .red)
                .frame(width: Dimensions.innerCircleSize, height: Dimensions.innerCircleSize)
        }
    }
}

struct OnOffCircleView_Previews: PreviewProvider {
    static var previews: some View {
        OnOffCircleView(online: true)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
