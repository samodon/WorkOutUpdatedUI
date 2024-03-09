//
//  WorkOutUpdatedUIApp.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/19/23.
//

import SwiftUI

@main
struct WorkOutUpdatedUIApp: App {
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
//            if !userData.hasValidData{
//                OnboardingView(userData: UserData())
//                    .environmentObject(userData)
//            }else{
//                HomeScreenView()
//                    .environmentObject(userData)
//            }
            HomeScreenView()
                        .environmentObject(userData)
        }
    }
}
