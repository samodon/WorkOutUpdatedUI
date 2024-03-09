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
        NavigationStack{
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
                Divider()
                
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
                Divider()
                // Challenges
                HStack {
                    NavigationLink(destination: WorkOutsView()) {
                        Image(systemName: "flag.circle")
                            .bold()
                            .font(.title3)
                        Text("Challenges")
                            .bold()
                            .font(.title3)
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
                .padding(.horizontal, 32)
                .padding(.top, 4)
                Divider()
                // Your Progress
                HStack {
                    NavigationLink(destination: ProgressView()) {
                        Image(systemName: "chart.bar")
                            .bold()
                        .font(.title3)
                        Text("Your Progress")
                            .bold()
                            .font(.title3)
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }
                .padding(.horizontal, 32)
                .padding(.top, 4)
                Divider()
                // Settings
                HStack {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .bold()
                        .font(.title3)
                        Text("Settings")
                            .bold()
                            .font(.title3)
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }
                .padding(.horizontal, 32)
                .padding(.top, 4)
                Divider()
                VStack{
                    HStack{
                        Text("Friend Activity:")
                            .bold()
                            .font(.title3)
                        Spacer()
                    }
                    Text("<user> completed <num> of <activity>")
                        .monospaced()
                    Divider()
                    Text("<user> completed <num> of <activity>")
                        .monospaced()
                    Divider()
                    Text("<user> completed <num> of <activity>")
                        .monospaced()
                }
                //.padding(.horizontal, 32)
                .padding(.top, 4)
                .padding()
                .background(.gray.opacity(0.5))
                .cornerRadius(5)
                .offset(x:15)
                .frame(width:270)
                Spacer()
            }
            
            .frame(width:300)
            //.foregroundStyle()
            .background(colorScheme == .dark ? Color.black : Color.white)
            //.background(.white)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


#Preview {
    SideMenuView()
}
