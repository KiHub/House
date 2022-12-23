//
//  HouseRow.swift
//  House
//
//  Created by  Mr.Ki on 13.12.2022.
//

import SwiftUI
import CoreLocation
/**
 This is the row view for HouseListView
 Here I create row layout
*/
struct HouseRow: View {
    @StateObject var locationManager = LocationManager()
    let house: House
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

struct HouseRow_Previews: PreviewProvider {
    static var previews: some View {
        HouseRow(house: House.mockHouse)
    }
}
