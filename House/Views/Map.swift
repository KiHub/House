//
//  Map.swift
//  House
//
//  Created by  Mr.Ki on 15.12.2022.
//

import SwiftUI
import MapKit

/// Map

struct MiniMap: View {
    let house: House
    
    var body: some View {
        //MARK: - Create mini map
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [house]) { house in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude)) {
                Image("point")
            }
        }
    }
}

