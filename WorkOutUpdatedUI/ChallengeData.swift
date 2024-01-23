//
//  ChallengeData.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/21/23.
//

import Foundation

struct Challenge: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    
}

let challenges = [
    Challenge(id: 0, name: "Push Ups", imageName: "push_up_image"),
    Challenge(id: 1, name: "Sit Ups", imageName: "sit_up_image"),
    Challenge(id: 2, name: "Pull Ups", imageName: "pull_up_image"),
    Challenge(id: 3, name: "Jumping Jacks", imageName: "jumping_jack_image"),
    Challenge(id: 4, name: "Squats", imageName: "squat_image")
]


