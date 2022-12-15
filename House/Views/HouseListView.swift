//
//  HouseListView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI


struct HouseListView: View {
    let houses: [House]
    
    @StateObject var locationManager = LocationManager()
    @State private var searchText: String = ""
    var filtredHouses: [House] {
        if searchText.count < 2 {
            return houses.sorted {
                $0.price < $1.price }
        } else {
            return houses.filter { $0.city.contains(searchText) || $0.zip.contains(searchText) || ($0.city.contains(searchText) && $0.zip.contains(searchText)) }.sorted {
                $0.price < $1.price }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                if filtredHouses.count != 0 {
                    
                    ForEach(filtredHouses) { house in
                        NavigationLink {
                            HouseDetailView(house: house)
                            
                        } label: {
                            HouseRow(house: house)
                            
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                } else {
                    NoResultView()
                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        print("Stop")
//                        locationManager.stopUpdate()
//                    } label: {
//                        Image(systemName: "location.slash")
//                            .scaleEffect(1)
//                    }
//                }
//            }
            .background(Color("DarkGray"))
            .searchable(text: $searchText)
            .navigationTitle("DTT REAL ESTATE")
            .font(.custom("GothamSSm-Medium", size: 16))
            .foregroundColor(Color("Strong"))
        }
    }
}
struct HouseListView_Previews: PreviewProvider {
    static var previews: some View {
        HouseListView(houses: [House.mockHouse])
    }
}
