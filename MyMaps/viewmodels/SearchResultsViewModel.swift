//
//  SearchResultsViewModel.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import MapKit

final class SearchResultsViewModel: ObservableObject {
    
    private var locationManager = LocationManager()
    
    func search(text: String, completion: @escaping([PlaceAnnotation]) -> Void) {
        guard text.count >= 2 else {
            completion([])
            return
        }
       
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = self.locationManager.region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            if let error { print(error) }
            guard let response = response, error == nil else {
                completion([])
                return
            }
            let places = response.mapItems.map(PlaceAnnotation.init)
            completion(places)
        }
    }
    
}
