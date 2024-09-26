//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct GameSimulationView: View {
    @Binding var path: NavigationPath // Pass the navigation path
    @State private var intensity: Double = 1.0
    
    
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
            .font(.custom("NFPixels-Regular", size: 40))
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Intensity: \(Int(intensity))") // Display current intensity as an integer
                .font(.custom("NFPixels-Regular", size: 40))
                .padding()
            
            // Slider with a range from 1 to 5
            Slider(value: $intensity, in: 1...5, step: 1)
                .padding()
            
            Spacer()
            
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
