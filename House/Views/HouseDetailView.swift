//
//  HouseDetailView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI
import MapKit

struct HouseDetailView: View {
    @StateObject var locationManager = LocationManager()
    
    @Environment(\.presentationMode) var presentatiomMode
    @Environment(\.dismiss) var dismiss
    let house: House
    let imageSize: CGFloat = 30
    let scale: CGFloat = 1
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            VStack {
                ScrollView {
                    imageSection
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        titleSection
                        Text("Description")
                            .font(.custom("GothamSSm-Medium", size: 16))
                        descriptionSection
                        Text("Location")
                            .font(.custom("GothamSSm-Medium", size: 16))
                        mapView2
                            .onTapGesture {
                                print("Hello!")
                                let latitude = house.latitude
                                let longitude = house.longitude
                                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                                if let safeUrl = url {
                                    if UIApplication.shared.canOpenURL(safeUrl) {
                                        UIApplication.shared.open(safeUrl, options: [:], completionHandler: nil)
                                    }
                                }
                            }
                        
                    }
                    .padding()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .background(Color("DarkGray"))
            }
            .overlay(alignment: .topLeading) {
                backButton
            }
        }
    }
}

extension HouseDetailView {
    
    private var imageSection: some View {
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
        }
    }
    
    private var titleSection: some View {
        
        HStack() {
            Text("$\(house.price)")
                .font(.custom("GothamSSm-Bold", size: 18))
            Spacer()
            HStack(alignment: .bottom) {
                HStack {
                    Image("bed-2")
                    Text("\(house.bedrooms)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                    
                }
                HStack {
                    Image("shower")
                    Text("\(house.bathrooms)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                
                HStack {
                    Image("square-measument")
                    Text("\(house.size)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                
                HStack {
                    Image("pin")
                    let coordinateUser = CLLocation(latitude: locationManager.lastLocation?.coordinate.latitude ?? 0, longitude: locationManager.lastLocation?.coordinate.longitude ?? 0)
                    let coordinateHouse = CLLocation(latitude: house.latitude, longitude: house.longitude)
                    let distance = (coordinateUser.distance (from: coordinateHouse))
                    let formatted = String(format: "%.0f", distance / 1000)
                    Text(formatted + "km")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .lineLimit(2)
                        .foregroundColor(Color("Medium"))
                }
            }
        }
    }
    private var descriptionSection: some View {
        Text(house.description)
            .font(.custom("GothamSSm-Light", size: 12))
            .foregroundColor(Color("Medium"))
    }
    
    private var mapView2: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [house]) { house in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude)) {
                Image("point")
            }
        }
        .cornerRadius(20)
        .frame(height: 200)
    }
    
    private var backButton: some View {
        Button {
            presentatiomMode.wrappedValue.dismiss()
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
