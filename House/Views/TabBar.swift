//
//  TabBar.swift
//  House
//
//  Created by  Mr.Ki on 13.12.2022.
//

import SwiftUI

/// Here I create tab bar

struct TabBar: View {
    
    @State var tabHomeImage = "home-2"
    @State var tabInfoImage = "info-button-2"
    @State var tabSaveImage = "heart2"
    @State var selectedTab = "home"
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        //MARK: - Tab bar
        TabView(selection: $selectedTab) {
            
            HouseListView().tabItem({
                Image(tabHomeImage)
            }).tag("home")
                .onAppear {self.tabHomeImage = "home"}
                .onDisappear {self.tabHomeImage = "home-2"}
            
            SavedHouseListView().tabItem({
                Image(tabSaveImage)
            }).tag("save")
                .onAppear {self.tabSaveImage = "heart1"}
                .onDisappear {self.tabSaveImage = "heart2"}
            
            AboutView().tabItem({
                Image(tabInfoImage)
            }).tag("info")
                .onAppear {self.tabInfoImage = "info-button"}
                .onDisappear {self.tabInfoImage = "info-button-2"}
        }
    }
}

