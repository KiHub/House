//
//  HouseDetailViewCD.swift
//  House
//
//  Created by  Mr.Ki on 16.12.2022.
//

import SwiftUI
import MapKit

struct HouseDetailViewCD: View {
    
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @StateObject var locationManager = LocationManager()
    @Environment(\.presentationMode) var presentatiomMode
    @Environment(\.dismiss) var dismiss
    let house: FetchedResults<Item>.Element
    let imageSize: CGFloat = 150
    let scale: CGFloat = 1
    
    var body: some View {
        //MARK: - Datail layout
        
        ZStack(alignment: .topLeading) {
            VStack {
                ScrollView {
                    VStack(spacing: -30) {
                        imageSection
                            .ignoresSafeArea()
                        VStack(alignment: .leading, spacing: 20) {
                            titleSection
                            Text("Description")
                                .font(.custom("GothamSSm-Medium", size: 16))
                            descriptionSection
                            Text("Location")
                                .font(.custom("GothamSSm-Medium", size: 16))
                            mapView
                            //MARK: - Navigation
                                .onTapGesture {
                                    let latitude = house.latitude
                                    let longitude = house.longitude
                                    let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                                    // pass data and open navigation app
                                    if let safeUrl = url {
                                        if UIApplication.shared.canOpenURL(safeUrl) {
                                            UIApplication.shared.open(safeUrl, options: [:], completionHandler: nil)
                                        }
                                    }
                                }
                        }
                        .padding()
                        .background(Color("LightGray"))
                        .cornerRadius(20)
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .background(Color("LightGray"))
            }
            //MARK: - Back button
            .overlay(alignment: .topLeading) {
                backButton
            }
            //            //MARK: - save button
            //            .overlay(alignment: .topTrailing) {
            //                saveButton
            //            }
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded({ value in
                
                if value.translation.width > 0 {
                    dismiss()
                }
            }))
        
        
        //        ZStack(alignment: .topLeading) {
        //            VStack {
        //                ScrollView {
        //                    imageSection
        //                        .ignoresSafeArea()
        //                    VStack(alignment: .leading, spacing: 20) {
        //                        titleSection
        //                        Text("Description")
        //                            .font(.custom("GothamSSm-Medium", size: 16))
        //                        descriptionSection
        //                        Text("Location")
        //                            .font(.custom("GothamSSm-Medium", size: 16))
        //                        mapView
        //                        //MARK: - Navigation
        //                            .onTapGesture {
        //                                let latitude = house.latitude
        //                                let longitude = house.longitude
        //                                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
        //                                // pass data and open navigation app
        //                                if let safeUrl = url {
        //                                    if UIApplication.shared.canOpenURL(safeUrl) {
        //                                        UIApplication.shared.open(safeUrl, options: [:], completionHandler: nil)
        //                                    }
        //                                }
        //                            }
        //                    }
        //                    .padding()
        //                }
        //                .navigationBarHidden(true)
        //                .navigationBarBackButtonHidden(true)
        //                .ignoresSafeArea()
        //                .background(Color("DarkGray"))
        //            }
        //            //MARK: - Back button
        //            .overlay(alignment: .topLeading) {
        //                backButton
        //            }
        //        }
    }
}
//MARK: - Extension
extension HouseDetailViewCD {
    //MARK: - Image
    private var imageSection: some View {
        VStack {
            if let url =  house.image {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .scaleEffect(scale)
                        
                    } else if phase.error != nil {
                        ZStack {
                            //    if something going wrong with image
                            Color("Light").frame(width: imageSize, height: imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .scaleEffect(scale)
                                .padding()
                            Text("❌")
                                .font(.system(size: 70))
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                                .padding()
                        }
                    } else {
                        //MARK: - progress view when image loading
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
                
            } else {
                ZStack {
                    // if no image
                    Color("Light").frame(width: imageSize, height: imageSize)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .scaleEffect(scale)
                        .padding()
                    Text("🏠")
                        .font(.system(size: 70))
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .padding()
                }
            }
        }
    }
    
    private var titleSection: some View {
        //MARK: - Title
        HStack {
            Text("$\(house.price)")
                .font(.custom("GothamSSm-Bold", size: 18))
            //   .foregroundColor(Color("Strong"))
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
        //MARK: - Description
        Text(house.description1 ?? "")
            .font(.custom("GothamSSm-Light", size: 12))
            .foregroundColor(Color("Medium"))
    }
    
    private var mapView: some View {
        //MARK: - Map
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


