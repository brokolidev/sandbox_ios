//
//  VeganFoodPlace.swift
//  sandbox
//
//  Created by Hyunseung Choi on 2020/11/02.
//

import Foundation
import MapKit


struct VeganFoodPlace: Identifiable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
