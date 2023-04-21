//
//  MapThumbnailWithExpand.swift
//  ChatApp
//
//  Created by wyn on 2023/4/21.
//

import SwiftUI
import MapKit

struct MapThumbnailWithExpand: View {
    let location: [Double]

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.506, longitude: -0.127),
                                                   span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))
    @State private var annotationItems = [MyAnnotationItem]()
    @State private var position = CLLocationCoordinate2D(latitude: 51.507, longitude: -0.127)
    @State private var showingFullMap = false

    private enum Dimensions {
        static let frameSize: CGFloat = 100
        static let imageSize: CGFloat = 70
        static let buttonSize: CGFloat = 30
        static let radius: CGFloat = 8
        static let buttonPadding: CGFloat = 4
    }

    var body: some View {
        VStack {
            Button(action: { showingFullMap.toggle() }, label: {
                Map(coordinateRegion: $region, annotationItems: annotationItems) { item in
                    MapPin(coordinate: item.coordinate)
                }
                .frame(width: Dimensions.imageSize, height: Dimensions.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: Dimensions.radius))
            })
            NavigationLink(destination: MapView(location: position,
                                                annotationItems: annotationItems),
                           isActive: $showingFullMap) {
                EmptyView()
            }
        }
        .onAppear(perform: setupLocation)
    }

    private func setupLocation() {
        position = CLLocationCoordinate2D(latitude: location[1], longitude: location[0])
        region = MKCoordinateRegion(
            center: position,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        annotationItems.append(MyAnnotationItem(coordinate: position))
    }
}

struct MapThumbnailWithExpand_Previews: PreviewProvider {
    static var previews: some View {
        MapThumbnailWithExpand(location: [-0.106, 51.506])
            .previewLayout(.sizeThatFits)
    }
}
