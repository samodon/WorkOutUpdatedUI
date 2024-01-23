//
//  WorkOutsView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/20/23.
//

import SwiftUI

struct WorkOutsView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(challenges) { challenge in
                        NavigationLink(destination: LeaderboardView(challengeName:challenge.name, challengeImage: challenge.imageName)) {
                            DailyChallengeCard(challenge: challenge)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Work Outs")
        }
    }
}




#Preview {
    WorkOutsView()
}
