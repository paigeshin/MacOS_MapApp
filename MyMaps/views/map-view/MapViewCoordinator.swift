//
//  MapViewCoordinator.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import AppKit
import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(
            center: mapView.userLocation.coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2
            )
        )
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? PlaceAnnotation else { return }
        view.canShowCallout = true
        view.detailCalloutAccessoryView = PlaceCallOutView(
            annotation: annotation,
            selectShowDirections: { [weak self] place in
                // Calculate Direction
                let start = MKMapItem.forCurrentLocation()
                let destination = MKMapItem(placemark: MKPlacemark(coordinate: place.coordinate))
                self?.calculateRoute(
                    start: start,
                    destination: destination,
                    completion: { route in
                        guard let route = route else { return }
                        view.detailCalloutAccessoryView = nil // replacing with route view
                        let controller = RouteContentViewController(route: route)
                        let routePopOver = RoutePopOver(controller: controller)
                        let rect = NSRect(x: mapView.frame.width / 2.6, y: 0, width: mapView.frame.width / 2, height: 30.0)
                        let positioningView = NSView(frame: rect)
                        mapView.addSubview(positioningView)
                        
                        // clear all the overlays
                        mapView.removeOverlays(mapView.overlays)
                        
                        // add overlay on the mapp
                        mapView.addOverlay(route.polyline, level: .aboveRoads)
                        
                        routePopOver.show(relativeTo: positioningView.frame, of: positioningView, preferredEdge: .minY)
                    }
                )
            }
        )
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 5.0
        renderer.strokeColor = NSColor.purple
        return renderer
    }
    
    private func calculateRoute(
        start: MKMapItem,
        destination: MKMapItem,
        completion: @escaping(MKRoute?) -> Void
    ) {
        let directionRequest = MKDirections.Request()
        directionRequest.transportType = .automobile // car
        directionRequest.source = start
        directionRequest.destination = destination
        let direction = MKDirections(request: directionRequest)
        direction.calculate { response, error in
            if let error { print(error) }
            guard
                let response = response,
                let route = response.routes.first,
                error == nil else {
                return
            }
            completion(route)
        }
    }
    
}


