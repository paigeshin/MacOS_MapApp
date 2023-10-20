//
//  MapScreen.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        MapView(
            annotations: self.appState.places,
            selectedPlace: self.appState.selectedPlace
        )
    } //: body
}

#Preview {
    MapScreen()
}
