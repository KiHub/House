//
//  Global.swift
//  House
//
//  Created by  Mr.Ki on 15.12.2022.
//

import SwiftUI

class Global: ObservableObject {
    @AppStorage("showOnboarding") var onboardingOn: Bool = true

}
