//
//  PlaceAnnotation.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import MapKit
import Contacts

// Holds the data we want to display
final class PlaceAnnotation: NSObject, MKAnnotation, Identifiable {
    let id = UUID()
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var title: String? { self.mapItem.name ?? "" }
    var phone: String { self.mapItem.phoneNumber ?? "" }
    var address: String {
        guard let postalAddress = mapItem.placemark.postalAddress else { return "" }
        return "\(postalAddress.street), \(postalAddress.city) \(postalAddress.state), \(postalAddress.postalCode)"
    }
    var location: CLLocation? { CLLocation(latitude: self.coordinate.latitude, longitude: self.coordinate.longitude) }
    var coordinate: CLLocationCoordinate2D { self.mapItem.placemark.coordinate }
    var city: String { self.mapItem.placemark.locality ?? "" }
    
    func getDistance(userLocation: CLLocation?) -> Double? {
        guard let placeLocation = self.mapItem.placemark.location,
              let userLocation = userLocation else {
            return nil
        }
        return userLocation.distance(from: placeLocation)
    }
 
}


