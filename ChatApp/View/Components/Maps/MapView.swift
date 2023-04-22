//
//  MapView.swift
//  ChatApp
//
//  Created by wyn on 2023/4/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode

    let location: CLLocationCoordinate2D
    let annotationItems: [MyAnnotationItem]

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: MapDefault.latitude,
                                                                                  longitude: MapDefault.longitude),
                                                   span: MKCoordinateSpan(latitudeDelta: MapDefault.zoomedOut,
                                                                          longitudeDelta: MapDefault.zoomedOut))

    private enum MapDefault {
        static let latitude: CGFloat = 51.507
        static let longitude: CGFloat = -0.127
        static let zoomedOut: CGFloat = 2.0
        static let zoomedIn: CGFloat = 0.01
    }

    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            annotationItems: annotationItems) { item in
            MapPin(coordinate: item.coordinate)
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            },
                                                label: {
                BackButton(label: "Dismiss")
            }))
            .onAppear(perform: setupLocation)
    }
    private func setupLocation() {
        region = MKCoordinateRegion(center: location,
                                    span: MKCoordinateSpan(latitudeDelta: MapDefault.zoomedIn,
                                                           longitudeDelta: MapDefault.zoomedIn))
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
