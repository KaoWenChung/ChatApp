//
//  MapThumbnailWithExpand.swift
//  ChatApp
//
//  Created by wyn on 2023/4/21.
//

import SwiftUI

struct MapThumbnailWithExpand: View {
    let location: [Double]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MapThumbnailWithExpand_Previews: PreviewProvider {
    static var previews: some View {
        MapThumbnailWithExpand(location: [-0.106, 51.506])
            .previewLayout(.sizeThatFits)
    }
}
