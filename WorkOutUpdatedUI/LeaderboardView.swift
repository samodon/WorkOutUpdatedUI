//
//  LeaderboardView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/20/23.
//

import SwiftUI
import ScalingHeaderScrollView

struct LeaderboardView: View {
    let challengeName: String
    let challengeImage: String
    var leaderboardEntries: [LeaderboardEntry] = []

    init(challengeName: String, challengeImage: String) {
        self.challengeName = challengeName
        self.challengeImage = challengeImage

        // Generating dummy data for 30 entries
        for i in 1...30 {
            leaderboardEntries.append(LeaderboardEntry(userName: "User\(i)", score: Int.random(in: 0...100)))
        }
    }

    var body: some View {
        NavigationStack {
            LeaderboardCard(challengeImage: challengeImage, entries: leaderboardEntries)
            HStack {
                
                NavigationLink(destination: CameraView()) {
                    Text("Solo")
                        .font(.system(.subheadline, design: .serif))
                }
                .buttonStyle(.plain)
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.243, saturation: 0.386, brightness: 0.773, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 2,
                        y: 2
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 3)
                }

                Spacer()
                Button(role: .none) {} label: {
                    Text("Challenge Friend")
                        .font(.system(.subheadline, design: .serif))
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                }
                .buttonStyle(.plain)
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.243, saturation: 0.386, brightness: 0.773, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 2,
                        y: 2
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 3)
                }

                Spacer()
                Button(role: .none) {} label: {
                    Text("Rando")
                        .font(.system(.subheadline, design: .serif))
                }
                .buttonStyle(.plain)
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.243, saturation: 0.386, brightness: 0.773, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 2,
                        y: 2
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 3)
                }
            }
            .padding([.leading, .trailing, .bottom])
            .bold()

            .navigationBarBackButtonHidden(false)
            .navigationTitle(challengeName)
        }
    }
}
struct LeaderboardEntry {
    var userName: String
    var score: Int
}
struct LeaderboardCard: View {
    let challengeImage: String
    var entries: [LeaderboardEntry]

    init(challengeImage: String, entries: [LeaderboardEntry]) {
        self.challengeImage = challengeImage
        self.entries = entries
    }

    var body: some View {
        VStack {
            ScalingHeaderScrollView {
                ZStack(alignment: .bottom) {
                    Image(challengeImage)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .mask(alignment: .center) {
                            RoundedRectangle(
                                cornerRadius: 8,
                                style: .circular
                            )
                            .fill(Color(uiColor: .systemGray))
                            
                        }
                    HStack{
                        Text("User:")
                            .bold()
                        Spacer()
                        Text("Score:")
                            .bold()
                    }.padding()
                }
            } content: {
                VStack {
                    ForEach(entries.prefix(30), id: \.userName) { entry in // Show the first 5 entries for the header card
                        HStack {
                            Image(systemName: "person.fill")
                            Text(entry.userName)
                            Spacer()
                            Text("\(entry.score)")
                        }
                        Divider()
                    }
                }
                .padding()
            }
            .height(min:60)
            .scrollIndicators(.hidden)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 8,
                style: .circular
            )
            .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
        }
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 8,
                style: .circular
            )
            .stroke(Color(uiColor: .black), lineWidth: 4)
            .shadow(
                color: Color(uiColor: .black),
                radius: 0,
                x: 3,
                y: 2
            )
        }
        .padding()
    }
}


#Preview {
    LeaderboardView(challengeName: "Push Ups", challengeImage: "push_up_image")
    //ContentView()
}

struct ContentView: View {
    var body: some View {
        ScalingHeaderScrollView {
            ZStack {
                Image("push_up_image")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .mask(alignment: .center) {
                        RoundedRectangle(
                            cornerRadius: 8,
                            style: .circular
                        )
                        .fill(Color(uiColor: .systemGray))
                    }
            }
        } content: {
            VStack {
                ForEach(1...30, id: \.self) { i in
                    HStack {
                        Image(systemName: "person.fill")
                        Text("name")
                        Spacer()
                        Text("50")
                    }
                    Divider()
                }
            }
        }
    }
}
