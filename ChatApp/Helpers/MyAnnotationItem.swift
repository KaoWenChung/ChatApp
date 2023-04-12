//
//  MyAnnotationItem.swift
//  ChatApp
//
//  Created by wyn on 2023/4/12.
//

import CoreLocation

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

final class LocationHelper: NSObject, ObservableObject {
    static let shared = LocationHelper()
    static let defaultLoaction = CLLocationCoordinate2D(latitude: 51.506, longitude: -0.106)
    static var currentLoaction: CLLocationCoordinate2D {
        guard let location = shared.locationManager.location else {
            return defaultLoaction
        }
        return location.coordinate
    }
    private let locationManager = CLLocationManager()

    private override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
