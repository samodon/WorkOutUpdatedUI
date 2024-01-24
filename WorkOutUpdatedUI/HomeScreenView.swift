//
//  ContentView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/19/23.
//

import SwiftUI

struct HomeScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    init() {}

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                NavigationLink(destination: ProgressView()) {
                    ChallengeCard()
                }

                HStack {
                    Text("Todays Challenges")
                        .font(.system(.title3, design: .monospaced))
                        .bold()
                    Spacer()
                    NavigationLink(destination: WorkOutsView()) {
                        Image(systemName: "chevron.compact.right")
                            .opacity(1)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                .padding()

                ScrollView(.horizontal, showsIndicators: false) { // Horizontal ScrollView
                    HStack(spacing: 11) {
                        ForEach(challenges, id: \.id) { challenge in
                            NavigationLink(destination: LeaderboardView(challengeName: challenge.name, challengeImage: challenge.imageName)) {
                                DailyChallengeCard(challenge: challenge)
                            }
                        }
                    }
                    .padding(10) // Padding for starting and ending cards
                }
                .frame(height: /* height of your card + any padding */ 200) // Set a fixed height for your horizontal scroll view

                HStack {
                    Text("Your Friend Activity")
                        .font(.system(.title3, design: .monospaced))
                        .bold()

                    Spacer()
                    Image(systemName: "chevron.compact.right")
                        .opacity(1)
                }
                .padding()

                FriendActivityCard()
            }
            .navigationTitle("Greetings, <Name>")
            .navigationBarItems(
                leading: Button(action: {
                    // action for leading button
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }),
                trailing: Button(action: {
                    // action for trailing button
                }, label: {
                    Image(systemName: "person.circle")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                })
            )
            .navigationBarBackButtonHidden()
        }
    }
}
struct DailyChallengeCard: View {
    let challenge: Challenge
    @Environment(\.colorScheme) var colorScheme


    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                VStack {
                    Spacer()
                    Text(challenge.name)  // Use challenge title here
                        .padding(6)
                        .font(.system(.body, design: .serif))
                        .foregroundColor(Color(uiColor: .black))
                }
            }
            .frame(width: 150, height: 150)
            .background(alignment: .center) {
                Image(challenge.imageName)
                    .resizable(resizingMode: .stretch)
                    .mask(alignment: .center) {
                        RoundedRectangle(cornerRadius: 8, style: .circular)
                        .fill(Color(uiColor: .systemGray))
                    }
            }
            .background(alignment: .center) {
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .circular
                )
                .fill(Color(hue: 0.178, saturation: 0.775, brightness: 0.871, opacity: 1))
                .shadow(
                    color: colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                    radius: 0,
                    x: 4,
                    y: 6
                )
                
            }
            .background(alignment: .center) {
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .circular
                )
                .stroke(
                    colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                    lineWidth: 5
                )
            }
            
            

            Text("Your high score:")
                .font(.system(.caption2, design: .default))
                .padding([.leading], 6)
                .padding([.top], 2)
                .foregroundColor(.black)
        }
    }
}
struct ChallengeCard: View {
    @Environment(\.colorScheme) var colorScheme
    init() {}

    var body: some View {
        ZStack(alignment: .top) {
            CalorieChartView()
                //.frame(width: 245)
                .offset(y:-15)
                .padding(10)
            VStack(alignment: .trailing) {
                Spacer()
                //Text("450")
                    .padding()
                    .font(.system(.title3, design: .monospaced))
                    .bold()
                    .foregroundColor(Color(hue: 0.583, saturation: 1, brightness: 0.4, opacity: 1))

                HStack {
//                    Text("Total Calories Burnt:")
//                        .padding()
                    //Spacer()
                    Text("Calories burned today: 700")
                        .font(.system(.title2, design: .serif))
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }
        .frame(
            minWidth: 350,
            maxWidth: 400,
            minHeight: 100,
            maxHeight: 150,
            alignment: .bottom
        )
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 20,
                style: .circular
            )
            .fill(Color(hue: 0.178, saturation: 0.775, brightness: 0.871, opacity: 1))
            .shadow(
                color:colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black) ,
                radius: 0,
                x: 5,
                y: 6
            )
        }
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 20,
                style: .circular
            )
            .stroke( colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                    lineWidth: 5)
        }
        .padding(16)
    }
}
struct FriendActivityCard: View {
    @Environment(\.colorScheme) var colorScheme
    init() {}

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "person")
                Text("<Username> completed <score> <activity> ")
                    .font(.system(.subheadline, design: .default))
            }
            .padding()

            Divider()
            HStack {
                Image(systemName: "person")
                Text("<Username> completed <score> <activity> ")
                    .font(.system(.subheadline, design: .default))
            }
            .padding()

            Divider()
            HStack {
                Image(systemName: "person")
                Text("<Username> completed <score> <activity> ")
                    .font(.system(.subheadline, design: .default))
            }
            .padding()
        }
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 20,
                style: .circular
            )
            .fill(Color(hue: 0.7, saturation: 0.56, brightness: 0.973, opacity: 1))
            .shadow(
                color: colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                radius: 0,
                x: 3,
                y: 3
            )
        }
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 20,
                style: .circular
            )
            .fill(colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black))
            .padding(-1)
        }
        .padding()
    }
}



#Preview {
    HomeScreenView()
}
