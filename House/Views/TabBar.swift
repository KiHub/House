//
//  TabBar.swift
//  House
//
//  Created by  Mr.Ki on 13.12.2022.
//

import SwiftUI

struct TabBar: View {
    @StateObject var houseFetcher = HouseFetcher()
    @State var tabHomeImage = "home-2"
    @State var tabInfoImage = "info-button-2"
    @State var selectedTab = "home"
    init() {
           UITabBar.appearance().backgroundColor = UIColor.white
       }
    var body: some View {
        TabView(selection: $selectedTab) {
            HouseListView(houses: houseFetcher.houses).tabItem({
                 Image(tabHomeImage)
             }).tag("home")
                 .onAppear{self.tabHomeImage = "home"}
                 .onDisappear{self.tabHomeImage = "home-2"}

             NoResultView().tabItem({
                 Image(tabInfoImage)
             }).tag("info")
                 .onAppear{self.tabInfoImage = "info-button"}
                 .onDisappear{self.tabInfoImage = "info-button-2"}
              }
    }
}
//
//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}
