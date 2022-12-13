//
//  HouseRow.swift
//  House
//
//  Created by  Mr.Ki on 13.12.2022.
//

import SwiftUI

struct HouseRow: View {
    let house: House
    let imageSize: CGFloat = 100
    let scale: CGFloat = 1
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            
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
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("$\(house.price)")
                        .font(.custom("GothamSSm-Medium", size: 16))
                    Text("\(house.zip)\(house.city)")
                        .font(.custom("GothamSSm-Light", size: 12))
                        .foregroundColor(Color("Medium"))
                }
               Spacer()
               
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
                    .padding(.vertical)
            }
        }
    }
}

struct HouseRow_Previews: PreviewProvider {
    static var previews: some View {
        HouseRow(house: House.mockHouse)
    }
}
