//
//  SearchResultList.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI

struct SearchResultList: View {
    
    
    @StateObject private var locationManager = LocationManager()
    
    let places: [PlaceAnnotation]
    var onSelect: (PlaceAnnotation) -> Void
    
    init(
        places: [PlaceAnnotation],
        onSelect: @escaping(PlaceAnnotation) -> Void
    ) {
        self.places = places
        self.onSelect = onSelect
    }
    
    private func formatDistance(for place: PlaceAnnotation) -> String {
        let distanceInMeters = place.getDistance(userLocation: self.locationManager.location)
        return distanceInMeters != nil ? "\(distanceInMeters!)" : ""
    }
    
    var body: some View {
        List(self.places) { place in
            VStack(alignment: .leading) {
                Text(place.title ?? "")
                Text("\(self.formatDistance(for: place))")
                    .font(.caption)
                    .opacity(0.4)
            } //: VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .onTapGesture {
                self.onSelect(place)
            }
        } //: List
    } //: body
}

#Preview {
    SearchResultList(places: [], onSelect: { _ in })
}
