//
//  RounteContentController.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import AppKit
import MapKit

final class RouteContentViewController: NSViewController {
    
    private var route: MKRoute
    
    init(route: MKRoute) {
        self.route = route
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = RouteCallOutView(route: self.route)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented...")
    }
    
}
