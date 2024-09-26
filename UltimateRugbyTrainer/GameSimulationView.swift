//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct GameSimulationView: View {
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
            NavigationLink(destination: TutorialView()){
                Text("Go to Tutorial")
                    .font(.custom("NFPixels-Regular", size: 40))
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
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
        
    }
}

#Preview {
    GameSimulationView()
}
