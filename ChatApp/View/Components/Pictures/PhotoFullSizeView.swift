//
//  PhotoFullSizeView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/23.
//

import SwiftUI

struct PhotoFullSizeView: View {
    let photo: Photo
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if let picture = photo.picture,
               let image = UIImage(data: picture) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            BackButton(label: "Dismiss")
        }))
    }
}

struct PhotoFullSizeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PhotoFullSizeView(photo: .sample)
        }
    }
}
