//
//  DistanceUnit.swift
//  MyMaps
//
//  Created by paige shin on 10/21/23.
//

import Foundation

enum DistanceUnit: String, Codable, CaseIterable {
    case miles
    case kilometers
}

extension DistanceUnit {
    
    var title: String {
        switch self {
        case .miles: return "mi"
        case .kilometers: return "km"
        }
    }
    
}
