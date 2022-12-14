//
//  HouseDetailView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI
import MapKit

struct HouseDetailView: View {

    
    @Environment(\.dismiss) var dismiss
    let house: House
    let imageSize: CGFloat = 200
    let scale: CGFloat = 1
    var body: some View {
        
            ScrollView {
                VStack {
                    if let url =  Constants.baseURL + house.image {
                        AsyncImage(url: URL(string: url)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .scaleEffect(scale)
                                    
                            } else if phase.error != nil {
                                ZStack {
                                    Color("Light").frame(width: imageSize, height: imageSize)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                        .scaleEffect(scale)
                                    Text("❌")
                                        .font(.system(size: 70))
                                        .scaledToFill()
                                        .frame(width: imageSize, height: imageSize)
                                }
                            } else {
                                ProgressView()
                                    .frame(width: imageSize, height: imageSize)
                            }
                        }
                        
                    } else {
                        ZStack {
                            Color("Light").frame(width: imageSize, height: imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .scaleEffect(scale)
                            Text("🏠")
                                .font(.system(size: 70))
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                       titleSection

                        Text("Description")
                            .font(.custom("GothamSSm-Medium", size: 16))
                        descriptionSection

                        Text("Location")
                            .font(.custom("GothamSSm-Medium", size: 16))
                        mapView2
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                
            }
            .overlay(alignment: .topLeading) {
                backButton
                    .offset(y: 20)
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
            .statusBar(hidden: true)
            .background(Color("DarkGray"))
    }
}

extension HouseDetailView {

    private var titleSection: some View {
        HStack(spacing: 100) {
        Text("$\(house.price)")
                .font(.custom("GothamSSm-Bold", size: 18))
            HStack(alignment: .bottom) {
                HStack{
                Image("bed-2")
                Text("\(house.bedrooms)")
                    .font(.custom("GothamSSm-Light", size: 10))
                    .foregroundColor(Color("Medium"))
                Spacer()
                Image("shower")
                Text("\(house.bathrooms)")
                    .font(.custom("GothamSSm-Light", size: 10))
                    .foregroundColor(Color("Medium"))
                Spacer()
                }
                
                HStack {
                Image("square-measument")
                Text("\(house.size)")
                    .font(.custom("GothamSSm-Light", size: 10))
                    .foregroundColor(Color("Medium"))
                Spacer()
                Image("pin")
            Text("123")
                    .font(.custom("GothamSSm-Light", size: 10))
                    .foregroundColor(Color("Medium"))
                Spacer()
                }
            }
        }
    }
    private var descriptionSection: some View {
        Text(house.description)
            .font(.custom("GothamSSm-Light", size: 12))
            .foregroundColor(Color("Medium"))
    }
//    private var mapView: some View {
//        MapView(house: House.mockHouse)
//            .cornerRadius(20)
//            .frame(height: 250)
//    }
    
    private var mapView2: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [house]) { house in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude)) {
                Image("point")
            }
        }
        .cornerRadius(20)
        .frame(height: 250)
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image("left-arrow-2")
                
        }
        .padding(20)
    }
}


struct HouseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HouseDetailView(house: House.mockHouse)
    }
}
