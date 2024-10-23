//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var colorSchemeModel: ColorSchemeModel
    /*
     TO USE CUSTOM COLORS:
     colorSchemeModel.colorScheme.[D1, D2, D3, D4, or D5]
     */
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                colorSchemeModel.colorScheme.D2 // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    
                    // Display the image
                    Image("title") // Refer to the image by its name in the assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 200)
                    Image("Rugby Ball")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    
                    // Settings Button
                    NavigationLink(destination: SettingsView(colorSchemeModel: colorSchemeModel)) {
                        PixelTextForButton(label: "Settings")
                    }
                    
                    
                    
                    // Game Simulation Button
                    NavigationLink(destination: GameSimulationView(colorSchemeModel: colorSchemeModel)) {
                        PixelTextForButton(label: "Game Simulation")
                        
                    }
                    
                    // Bronco Trainer Button (disabled)
                    PixelTextForButton(label: "Bronco", backgroundColor: .gray, outlineColor: .white, textColor: .white)
                    
                    Text("Coming soon!")
                        .font(.custom("NFPixels-Regular", size: 20))
                        .foregroundColor(colorSchemeModel.colorScheme.D1)
                    Spacer()
                    
                    
                    
                }
                .padding() // Add padding to avoid content getting too close to the edges
            }
            .navigationTitle("Ultimate Rugby Trainer")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}


#Preview {
    ContentView(colorSchemeModel: ColorSchemeModel())
}
