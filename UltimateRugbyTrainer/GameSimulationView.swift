//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

/*
 Author: Jackson Evarts w/ ChatGPT circa 2024-10-03
 */
 

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
                    
                    Spacer()
                    
                    Text("Intensity") // Display current intensity as an integer
                        .font(.custom("NFPixels-Regular", size: 30))
                        .foregroundColor(colorSchemeModel.colorScheme.D1)
                    
                    
                    
                    BouncingSlider(value: $intensity, colorSchemeModel: colorSchemeModel)
                        .padding(.horizontal, 30)
                    
                    NavigationLink(destination: PlayView(intensity: Int(intensity), colorSchemeModel: colorSchemeModel)){
                        Text("Play at Intensity \(Int(intensity))")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(colorSchemeModel.colorScheme.D5)
                            .foregroundColor(colorSchemeModel.colorScheme.D1)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(colorSchemeModel.colorScheme.D4, lineWidth: 5)
                            )
                            .padding()
                    }
                    
                    // Button to navigate to TutorialView
                    NavigationLink(destination: TutorialView()){
                        Text("Tutorial")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(colorSchemeModel.colorScheme.D4)
                            .foregroundColor(colorSchemeModel.colorScheme.D1)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(colorSchemeModel.colorScheme.D3, lineWidth: 5)
                            )
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
