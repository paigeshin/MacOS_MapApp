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
    
    func makeNSView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true 
        return map
    }
    
    func updateNSView(_ nsView: MKMapView, context: Context) {
        
    }
    
}
