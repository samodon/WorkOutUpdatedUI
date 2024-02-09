//
//  CameraView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/26/23.
//
import SwiftUI
struct CameraView: View {
    @Environment(\.colorScheme) var colorScheme
    var challengeName: String
    var body: some View {
        NavigationStack {
            VStack {
                CameraViewControllerRepresentable(challengeName: challengeName) // Pass challengeName here
                    .shadow(color:(colorScheme == .dark ? Color(uiColor: .black) : Color(uiColor: .black)), radius: 0, x: 5, y: 2)
                    //.frame(minWidth: 350, maxWidth: 450, minHeight: 650, maxHeight: 700)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black), lineWidth: 4)
                            
                    )
                    .padding()

            }
            .navigationTitle("Challenge")
        }
    }
}

struct CameraViewControllerRepresentable: UIViewControllerRepresentable {
    var challengeName: String // Add this property
    @EnvironmentObject var userData: UserData


    func makeUIViewController(context: Context) -> ViewController {
        return ViewController(workoutType: challengeName, userData: userData) // Use challengeName to initialize ViewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Update the view controller if needed.
    }
}

#Preview {
    CameraView( challengeName: "Push Ups")
}
