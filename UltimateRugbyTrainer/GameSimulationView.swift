//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct GameSimulationView: View {
    @Binding var path: NavigationPath // Pass the navigation path

    var body: some View {
        VStack {
            /*
            Text("Game Simulation")
                .font(.largeTitle)
                .padding()
             */
            Spacer()
            
            // Button to navigate to TutorialView
            Button("Go to Tutorial") {
                path.append("Tutorial") // Append an identifier to the path
            }
            .font(.title)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .navigationTitle("Game Simulation")
        .navigationDestination(for: String.self) { value in
            if value == "Tutorial" {
                TutorialView(path: $path)
            }
        }
    }
}

#Preview {
    GameSimulationView(path: .constant(NavigationPath()))
}
