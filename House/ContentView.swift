//
//  ContentView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var global = Global()
    var body: some View {
      //  TabBar()
        if global.onboardingOn {
            OnboardingManager()
        } else {
            TabBar()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
