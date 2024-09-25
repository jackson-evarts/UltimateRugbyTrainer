//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath() // Create a path to track the stack

    var body: some View {
        NavigationStack(path: $path) { // Use a NavigationStack with the path
            VStack {
                // Button to navigate to GameSimulationView
                
                Spacer()
                
                Button("Go to Game Simulation") {
                    path.append("GameSimulation") // Append an identifier to the path
                }
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Bronco Trainer") {
                    // TODO: Make it so after 20 clicks the button doesn't click anymore
                }
                .font(.title)
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                Text("Coming soon!")
                
                Spacer()
                
                
            }
            .navigationTitle("Main Menu")
            // Define the navigation destinations based on the path
            .navigationDestination(for: String.self) { value in
                if value == "GameSimulation" {
                    GameSimulationView(path: $path) // Navigate to GameSimulationView
                }
                if value == "BroncoTrainer" {
                    // TODO: Future endeavor for the app.
                }
            } // End navigation logic
        }
    }
}


#Preview {
    ContentView()
}
