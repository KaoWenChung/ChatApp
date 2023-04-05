//
//  ThumbNailView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/5.
//

import SwiftUI

struct ThumbnailView: View {
    let photo: Photo?
    private let compressionQuality: CGFloat = 0.8

    var body: some View {
        VStack {
            if let photo {
                if photo.thumbNail != nil || photo.picture != nil {
                    if let photo = photo.thumbNail {
                        Thumbnail(imageData: photo)
                    } else {
                        if let photo = photo.picture {
                            Thumbnail(imageData: photo)
                        } else {
                            Thumbnail(imageData: UIImage().jpegData(compressionQuality: compressionQuality)!)
                        }
                    }
                }
            }
        }
    }
}

struct ThumbNailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThumbnailView(photo: .sample)
            ThumbnailView(photo: nil)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
