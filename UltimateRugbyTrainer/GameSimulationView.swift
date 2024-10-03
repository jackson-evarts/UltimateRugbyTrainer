//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct GameSimulationView: View {
    @State private var intensity: Double = 1.0
    @ObservedObject var colorSchemeModel: ColorSchemeModel
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                // Background color filling the entire screen
                colorSchemeModel.colorScheme.D2 // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    
                    /*
                     Text("Game Simulation")
                     .font(.largeTitle)
                     .padding()
                     */
                    Image("GameSimTitle") // Refer to the image by its name in the assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
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
                    
                    NavigationLink(destination: PlayView(intensity: Int(intensity), colorSchemeModel: ColorSchemeModel())){
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
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

#Preview {
    GameSimulationView(colorSchemeModel: ColorSchemeModel())
}
