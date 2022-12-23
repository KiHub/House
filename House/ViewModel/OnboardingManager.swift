//
//  OnboardingManager.swift
//  House
//
//  Created by  Mr.Ki on 15.12.2022.
//

import SwiftUI

/// Onboarding logic

struct OnboardingManager: View {
    @State private var currentTab = 0
    var body: some View {
        
        TabView(selection: $currentTab,
                content:  {
            ForEach(OnboardingData.list) { viewData in
                
                OnboardingView(data: viewData)
                    .tag(viewData.id)
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


struct OnboardingManager_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingManager()
    }
}

