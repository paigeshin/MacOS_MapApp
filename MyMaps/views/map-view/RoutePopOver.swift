//
//  RoutePopOver.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import Foundation
import AppKit
import MapKit

final class RoutePopOver: NSPopover {
    
    init(controller: RouteContentViewController) {
        super.init()
        self.contentViewController = controller
        self.contentSize = controller.view.frame.size
        self.behavior = .transient
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

