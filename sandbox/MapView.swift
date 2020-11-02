//
//  MapView.swift
//  sandbox
//
//  Created by Hyunseung Choi on 2020/11/02.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56.948889, longitude: 24.106389),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let veganPlacesInRiga = [
        VeganFoodPlace(name: "Kozy Eats", latitude: 56.951924, longitude: 24.125584),
        VeganFoodPlace(name: "Green Pumpkin", latitude:  56.967520, longitude: 24.105760),
        VeganFoodPlace(name: "Terapija", latitude: 56.9539906, longitude: 24.13649290000000)
    ]
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion,
            annotationItems: veganPlacesInRiga) { place in
//            MapMarker(coordinate: place.coordinate, tint: .green)
            MapAnnotation(coordinate: place.coordinate) {
                Button(action: {
                    print("clicked")
                }) {
                    Image("marker").resizable().scaledToFit()
                }.frame(width: 100, height: 100, alignment: .center)
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
