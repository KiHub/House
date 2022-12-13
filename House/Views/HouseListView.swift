//
//  HouseListView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI

struct HouseListView: View {
    let houses: [House]
    
    
    @State private var searchText: String = ""
    var filtredHouses: [House] {
        if searchText.count == 0 {
            return houses
        } else {
            return houses.filter { $0.city.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                if filtredHouses.count != 0 {
                    ForEach(filtredHouses) { house in
                        NavigationLink {
                            //
                        } label: {
                            HouseRow(house: house)

                        }
                        .listRowSeparator(.hidden)
                        
                    }
                } else {
                    NoResultView()
                }
            }
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
