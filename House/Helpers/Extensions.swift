//
//  Extensions.swift
//  House
//
//  Created by  Mr.Ki on 21.12.2022.
//

import SwiftUI
import MapKit

/// Extensions

//MARK: - Extension HouseDetailViewCD
extension HouseDetailViewCD {
    //MARK: - Image
    var imageSection: some View {
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
    
    var titleSection: some View {
        //MARK: - Title
        HStack {
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
    var descriptionSection: some View {
        //MARK: - Description
        Text(house.description1 ?? "")
            .font(.custom("GothamSSm-Light", size: 12))
            .foregroundColor(Color("Medium"))
    }
    
    var mapView: some View {
        //MARK: - Map
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [house]) { house in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude)) {
                Image("point")
            }
        }
        .cornerRadius(20)
        .frame(height: 200)
    }
    
    var backButton: some View {
        Button {
            presentatiomMode.wrappedValue.dismiss()
        } label: {
            Image("left-arrow-2")
        }
        .padding(20)
    }
    
    func navigation() {
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

//MARK: - Extension HouseDetailView
extension HouseDetailView {
    
    var saveButton: some View {
        Button {
            //MARK: - Save to CD
            DataManager().addHouse(id: Int64(house.id), image: (Constants.baseURL + house.image), price: Int64(house.price), bedrooms: Int64(house.bedrooms), bathrooms: Int64(house.bathrooms), size: Int64(house.size), description: house.description, zip: house.zip, city: house.city, latitude: house.latitude, longitude: house.longitude, createdDate: house.createdDate, context: managedObjectContext)
        } label: {
            Image("heart2")
        }
        .padding(20)
    }
    //MARK: - Image
    var imageSection: some View {
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
                            // if something going wrong with image
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
    
    var titleSection: some View {
        //MARK: - Title
        HStack {
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
    var descriptionSection: some View {
        //MARK: - Description
        Text(house.description)
            .font(.custom("GothamSSm-Light", size: 12))
            .foregroundColor(Color("Medium"))
    }
    
    var mapView: some View {
        //MARK: - Map
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [house]) { house in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: house.latitude, longitude:  house.longitude)) {
                Image("point")
            }
        }
        .cornerRadius(20)
        .frame(height: 200)
    }
    
    var backButton: some View {
        Button {
            presentatiomMode.wrappedValue.dismiss()
        } label: {
            Image("left-arrow-2")
        }
        .padding(20)
    }
    
    func navigation() {
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


//MARK: - Extension HouseRow
extension HouseRow {
    
     var textSection: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("$\(house.price)")
                    .font(.custom("GothamSSm-Medium", size: 16))
                    .foregroundColor(Color("Strong"))
                Text("\(house.zip) \(house.city)")
                    .font(.custom("GothamSSm-Light", size: 12))
                
                    .foregroundColor(Color("Medium"))
            }
            Spacer()
            HStack(alignment: .bottom) {
                HStack{
                    Image("bed-2")
                    Text("\(house.bedrooms)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                Spacer()
                HStack {
                    Image("shower")
                    Text("\(house.bathrooms)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                Spacer()
                
                HStack {
                    Image("square-measument")
                    Text("\(house.size)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                Spacer()
                HStack {
                    Image("pin")
                    //MARK: - Calculate distance
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
                Spacer()
            }
            .padding(.vertical)
        }
    }
    
     var imageSection: some View {
        
        VStack {
            if let url =  Constants.baseURL + house.image {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
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
}


//MARK: - Extension HouseRow
extension HouseRowCD {
    
     var textSection: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("$\(house.price)")
                    .font(.custom("GothamSSm-Medium", size: 16))
                    .foregroundColor(Color("Strong"))
                Text("\(house.zip ?? "") \(house.city ?? "")")
                    .font(.custom("GothamSSm-Light", size: 12))
                
                    .foregroundColor(Color("Medium"))
            }
            Spacer()
            HStack(alignment: .bottom) {
                HStack{
                    Image("bed-2")
                    Text("\(house.bedrooms)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                Spacer()
                HStack {
                    Image("shower")
                    Text("\(house.bathrooms)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                Spacer()
                
                HStack {
                    Image("square-measument")
                    Text("\(house.size)")
                        .font(.custom("GothamSSm-Light", size: 10))
                        .minimumScaleFactor(0.4)
                        .foregroundColor(Color("Medium"))
                }
                Spacer()
                HStack {
                    Image("pin")
                    //MARK: - Calculate distance
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
                Spacer()
            }
            .padding(.vertical)
        }
    }
    
     var imageSection: some View {
         
         VStack {
             if let url =  house.image {
                 AsyncImage(url: URL(string: url)) { phase in
                     if let image = phase.image {
                         image.resizable()
                             .scaledToFill()
                             .frame(width: imageSize, height: imageSize)
                             .clipShape(RoundedRectangle(cornerRadius: 20.0))
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
}
