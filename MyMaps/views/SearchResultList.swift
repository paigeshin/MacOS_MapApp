//
//  SearchResultList.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI

struct SearchResultList: View {
    
    let places: [PlaceAnnotation]
    @StateObject private var locationManager = LocationManager()
    
    private func formatDistance(for place: PlaceAnnotation) -> String {
        let distanceInMeters = place.getDistance(userLocation: self.locationManager.location)
        return distanceInMeters != nil ? "\(distanceInMeters!)" : ""
    }
    
    var body: some View {
        List(self.places) { place in
            VStack {
                Text(place.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(self.formatDistance(for: place))")
                    .font(.caption)
                    .opacity(0.4)
            } //: VStack
        } //: List
    } //: body
}

#Preview {
    SearchResultList(places: [])
}
