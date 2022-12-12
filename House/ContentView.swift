//
//  ContentView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var houseFetcher = HouseFetcher()
    var body: some View {

        HouseListView(houses: houseFetcher.houses)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
