//
//  SearchBox.swift
//  ChatApp
//
//  Created by wyn on 2023/4/16.
//

import SwiftUI

struct SearchBox: View {
    var placeholder = "Search"
    @Binding var searchText: String

    private enum Dimensions {
        static let inset: CGFloat = 7.0
        static let bottomInset: CGFloat = 4.0
        static let heightTextField: CGFloat = 36.0
        static let cornerRadius: CGFloat = 10.0
        static let padding: CGFloat = 16
        static let topPadding: CGFloat = 15
        static let glassSize: CGFloat = 24
        static let dividerHeight: CGFloat = 1
    }

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .frame(width: Dimensions.glassSize, height: Dimensions.glassSize)
                TextField(placeholder, text: $searchText)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.body)
            }
            .padding(EdgeInsets(top: Dimensions.inset,
                                leading: Dimensions.bottomInset,
                                bottom: Dimensions.inset,
                                trailing: Dimensions.inset))
            .frame(height: Dimensions.heightTextField)
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(Dimensions.cornerRadius)
            .padding([.horizontal, .top], Dimensions.padding)
            Divider()
                .padding(.top, Dimensions.topPadding)
                .frame(height: Dimensions.dividerHeight)
        }
    }
}

struct SearchBox_Previews: PreviewProvider {
    static var previews: some View {
        SearchBox(searchText: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
