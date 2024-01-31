//
//  SideMenuView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 1/30/24.
//

import SwiftUI

struct SideMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading) {
            // Profile
            HStack {
                Image(systemName: "person.circle")
                    
                    .bold()
                    .font(.title3)
                Text("Profile")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 4)

            // Leaderboards
            HStack {
                Image(systemName: "list.number")
                    .bold()
                    .font(.title3)
                Text("Leaderboards")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 4)

            // Settings
            HStack {
                Image(systemName: "gearshape")
                    .bold()
                    .font(.title3)
                Text("Settings")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 4)

            // Challenges
            HStack {
                Image(systemName: "flag.circle")
                    .bold()
                    .font(.title3)
                Text("Challenges")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 4)

            // Your Progress
            HStack {
                Image(systemName: "chart.bar")
                    .bold()
                    .font(.title3)
                Text("Your Progress")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 4)

            Spacer()
        }
        .frame(width:275)
        //.foregroundStyle()
        .background(colorScheme == .dark ? Color.black : Color.white)
        //.background(.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    SideMenuView()
}
