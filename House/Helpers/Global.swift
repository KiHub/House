//
//  Global.swift
//  House
//
//  Created by  Mr.Ki on 15.12.2022.
//

import SwiftUI

/// Appstorage container for info about first launch, using for onboardimg

class Global: ObservableObject {
    @AppStorage("showOnboarding") var onboardingOn: Bool = true

}
