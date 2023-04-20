//
//  ThumbnailWithExpand.swift
//  ChatApp
//
//  Created by wyn on 2023/4/20.
//

import SwiftUI

struct ThumbnailWithExpand: View {
    let photo: Photo

    @State private var showingFullImage = false

    private enum Dimensions {
        static let frameSize: CGFloat = 100
        static let imageSize: CGFloat = 70
        static let buttonSize: CGFloat = 30
        static let radius: CGFloat = 8
        static let buttonPadding: CGFloat = 4
    }

    var body: some View {
        VStack {
            Button(action: { showingFullImage = true }) {
                ThumbnailView(photo: photo)
                    .frame(width: Dimensions.imageSize, height: Dimensions.imageSize, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: Dimensions.radius))
            }
            // TODO: PhotoFullSizeView
        }
    }
}

struct ThumbnailWithExpand_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThumbnailWithExpand(photo: .sample)
        }
    }
}
