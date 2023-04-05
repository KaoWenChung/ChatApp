//
//  ThumbNail.swift
//  ChatApp
//
//  Created by wyn on 2023/4/5.
//

import SwiftUI

struct Thumbnail: View {
    let imageData: Data

    var body: some View {
        Image(uiImage: (UIImage(data: imageData) ?? UIImage()))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ThumbNail_Previews: PreviewProvider {
    static var previews: some View {
        Thumbnail(imageData: (UIImage(named: "Tom") ?? UIImage()).jpegData(compressionQuality: 0.8)!)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
