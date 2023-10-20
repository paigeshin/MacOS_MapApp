//
//  DistanceFormatter.swift
//  MyMaps
//
//  Created by paige shin on 10/21/23.
//

import Foundation
import CoreLocation

final class DistanceFormatter {
    
    var unitOptions: DistanceUnit = .miles
    
    func format(distanceInMeters: Double) -> String {
        switch self.unitOptions {
        case .miles:
            return self.formatForMiles(distanceInMeters: distanceInMeters)
        case .kilometers:
            return self.formatForKms(distanceInMeters: distanceInMeters)
        }
    }
    
    private func formatForMiles(distanceInMeters: Double) -> String {
        switch distanceInMeters {
        case 0...182: return distanceInMeters.toFeet().displayDistance(.feet)
        case 183...: return distanceInMeters.toMiles().displayDistance(.miles)
        default: return distanceInMeters.toFeet().displayDistance(.feet)
        }
    }
    
    private func formatForKms(distanceInMeters: Double) -> String {
        switch distanceInMeters {
        case 0...900: return distanceInMeters.toMeters().displayDistance(.meters)
        case 901...: return distanceInMeters.toKms().displayDistance(.kilometers)
        default: return distanceInMeters.toMeters().displayDistance(.meters)
        }
    }
    
}

enum DisplayDistanceUnit {
    case feet
    case meters
    case miles
    case kilometers
}

extension Measurement where UnitType: UnitLength {
    
    func displayDistance(_ unit: DisplayDistanceUnit) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        switch unit {
        case .feet, .meters:
            formatter.numberFormatter.maximumFractionDigits = 0
        case .miles, .kilometers:
            formatter.numberFormatter.maximumFractionDigits = 1
        }
        return formatter.string(from: self)
    }
    
//    var distanceToDisplay: String {
//        let formatter = MeasurementFormatter()
//        formatter.unitOptions = .providedUnit
//        formatter.numberFormatter.maximumFractionDigits = 0
//        return formatter.string(from: self)
//    }
    
}

extension CLLocationDistance {
    
    func toFeet() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .feet)
    }
    
    func toMeters() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .meters)
    }
    
    func toMiles() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .miles)
    }
    
    func toKms() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .kilometers)
    }
    
}
