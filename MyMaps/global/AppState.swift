//
//  AppState.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation

final class AppState: ObservableObject {
    
    @Published var places: [PlaceAnnotation] = []
    @Published var selectedPlace: PlaceAnnotation?
    
    
}
