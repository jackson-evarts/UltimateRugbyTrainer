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
                Text("Tutorial")
                    .font(.custom("NFPixels-Regular", size: 40))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            // TODO: Make buttons and sliders sexy
            
            Text("Intensity") // Display current intensity as an integer
                .font(.custom("NFPixels-Regular", size: 30))
                .padding()
            
            // Slider with a range from 1 to 5
            Slider(value: $intensity, in: 1...5, step: 1)
                .padding()
            
            NavigationLink(destination: PlayView(intensity: Int(intensity))){
                Text("Play at Intensity \(Int(intensity))")
                    .font(.custom("NFPixels-Regular", size: 40))
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationTitle("Game Simulation")
        
    }
}

#Preview {
    GameSimulationView()
}
