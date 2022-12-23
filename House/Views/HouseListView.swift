//
//  HouseListView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI
/**
 This is  the main app view.
 Here I create a list of houses
*/
struct HouseListView: View {
    @StateObject var vm = ViewModel()
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            List {
                //MARK: - Fill list
                if vm.filtredHouses.count != 0 {
                    ForEach(vm.filtredHouses) { house in
                        NavigationLink {
                            HouseDetailView(house: house)
                        } label: {
                            HouseRow(house: house)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color("LightGray"))
                        .shadow(color: Color.black.opacity(0.1), radius: 4)
                        
                    }
                } else {
                    //MARK: - No result in search
                    NoResultView()
                }
            }
            .listStyle(.plain)
            .background(Color("LightGray"))
            .searchable(text: $vm.searchText)
            .navigationTitle("DTT REAL ESTATE")
            .font(.custom("GothamSSm-Medium", size: 16))
            .foregroundColor(Color("Strong"))
            .background(.clear)
        }
    }
}
struct HouseListView_Previews: PreviewProvider {
    static var previews: some View {
        HouseListView()
    }
}
