//
//  MapView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    let location: CLLocationCoordinate2D
    let annotationItems: [MyAnnotationItem]

    var body: some View {
        // TODO: MapView
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let position = CLLocationCoordinate2D(latitude: 51.506, longitude: -0.11)
        Group {
            NavigationView {
                MapView(location: position, annotationItems: [])
            }
            NavigationView {
                MapView(location: position, annotationItems: [MyAnnotationItem(coordinate: position)])
            }
        }
    }
}
