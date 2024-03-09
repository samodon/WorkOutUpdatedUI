import SwiftUI
import Combine

class UserData: ObservableObject {
    @Published var mainUser: User
    
    struct User: Identifiable, Codable {
        let id: UUID
        var username: String
        var workoutScores: [String: Int]
     
        
        init(id: UUID = UUID(), username: String, workoutScores: [String: Int] = [:]) {
            self.id = id
            self.username = username
            self.workoutScores = workoutScores
        }
    }

    init() {
        if let savedUserData = UserDefaults.standard.object(forKey: "mainUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUserData) {
                self.mainUser = loadedUser
                return
            }
        }
        // Initialize the main user with some default data if not found in UserDefaults
        mainUser = User(username: "JohnDoe")
    }

    func updateHighScore(activity: String, newScore: Int) {
        let currentScore = mainUser.workoutScores[activity] ?? 0
        print("Updating score for \(activity). Current score: \(currentScore), New score: \(newScore)")
        if newScore > currentScore {
            mainUser.workoutScores[activity] = newScore
            saveToUserDefaults()
            print("Score updated to \(newScore)")
        }
    }
    
    func saveToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(mainUser) {
            UserDefaults.standard.set(encoded, forKey: "mainUser")
        }
    }
    
    // Method to generate leaderboard entries for a specific activity
    func leaderboardEntries(for activity: String) -> [LeaderboardEntry] {
        // Since we're dealing with a single user, this method will return an array with one or zero elements
        if let score = mainUser.workoutScores[activity] {
            return [LeaderboardEntry(userName: mainUser.username, score: score)]
        } else {
            // If there's no score for the activity, return an empty array
            return []
        }
    }
}
