//
//  HouseRowCD.swift
//  House
//
//  Created by  Mr.Ki on 16.12.2022.
//

import SwiftUI
import CoreLocation
/**
 This is the row view for HouseListViewCD
 Here I create row layout for core data fetched houses
*/
struct HouseRowCD: View {
    
    @StateObject var locationManager = LocationManager()
    let house: FetchedResults<Item>.Element
    let imageSize: CGFloat = 100
    let scale: CGFloat = 1
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            //MARK: - load and show image + options for errors
            imageSection
            //MARK: - Fill text data
            textSection
        }
        .padding()
        .background(Color("White"))
        .cornerRadius(20)
    }
}

