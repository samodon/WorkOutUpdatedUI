import Foundation
import Combine

class UserData: ObservableObject {
    @Published var mainUser: User
    //static let shared = UserData()
    
    struct User: Identifiable {
        let id: UUID
        var name: String
        var workoutScores: [String: Int]
        
        init(id: UUID = UUID(), name: String, workoutScores: [String: Int] = [:]) {
            self.id = id
            self.name = name
            self.workoutScores = workoutScores
        }
    }

    init() {
        // Initialize the main user with some default data or fetch from storage
        mainUser = User(name: "John Doe")
    }

    func updateHighScore(activity: String, newScore: Int) {
        let currentScore = mainUser.workoutScores[activity] ?? 0
        print("Updating score for \(activity). Current score: \(currentScore), New score: \(newScore)")
        if newScore > currentScore {
            mainUser.workoutScores[activity] = newScore
            print("Score updated to \(newScore)")
        }
    }

    
    // Method to generate leaderboard entries for a specific activity
    func leaderboardEntries(for activity: String) -> [LeaderboardEntry] {
        // Since we're dealing with a single user, this method will return an array with one or zero elements
        if let score = mainUser.workoutScores[activity] {
            return [LeaderboardEntry(userName: mainUser.name, score: score)]
        } else {
            // If there's no score for the activity, return an empty array
            return []
        }
    }
}

