//
//  LocationManager.swift
//  friendpoint
//
//  Created by Omer Elhiraika on 5/16/20.
//  Copyright © 2020 Sam Wang. All rights reserved.
//

import Combine
import CoreLocation

class LocationRetriever: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

     @Published var location: CLLocation? {
       willSet { objectWillChange.send() }
     }
    
    var latitude: CLLocationDegrees {
        return location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees {
        return location?.coordinate.longitude ?? 0
    }
    
    override init() {
      super.init()

      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
    }
}

extension LocationRetriever: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}

