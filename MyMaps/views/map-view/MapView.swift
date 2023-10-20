//
//  MapView.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: NSViewRepresentable {
    
    typealias NSViewType = MKMapView
    
    private var annotations: [PlaceAnnotation] = []
    
    init(annotations: [PlaceAnnotation]) {
        self.annotations = annotations
    }
    
    func makeNSView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func updateNSView(_ map: MKMapView, context: Context) {
        // remove all annotations
        map.removeAnnotations(map.annotations)
        
        // add annotations
        map.addAnnotations(self.annotations)
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
    
}
