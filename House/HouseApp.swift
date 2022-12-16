//
//  HouseApp.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI

@main
struct HouseApp: App {
    @StateObject private var dataManager = DataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
