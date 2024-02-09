//
//  WorkOutUpdatedUIApp.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/19/23.
//

import SwiftUI

@main
struct WorkOutUpdatedUIApp: App {
    @StateObject private var userData = UserData()
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(userData)
        }
    }
}
