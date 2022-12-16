//
//  OnboardingData.swift
//  House
//
//  Created by  Mr.Ki on 15.12.2022.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let on: Bool
    
    static let list: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "home", primaryText: "Welcome to Home app", on: false),
        OnboardingData(id: 1, objectImage: "finish", primaryText: "Here you can find the perfect houses around your location", on: true)
    ]
}