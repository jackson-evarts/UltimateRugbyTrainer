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
     colorSchemeModel.colorScheme.[D1, D2, D3, mainDetail, or accent]
     */
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                colorSchemeModel.colorScheme.D1 // Background color #8585a4
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    // Display the image
                    Image("title") // Refer to the image by its name in the assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .padding()
                    
                    
                    Spacer()
                    
                    // Settings Button
                    NavigationLink(destination: SettingsView(colorSchemeModel: colorSchemeModel)) {
                        Text("Settings")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(colorSchemeModel.colorScheme.D1) // Background color #ccccd9
                            .foregroundColor(colorSchemeModel.colorScheme.mainDetail) // Text color #3c3c6c
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(colorSchemeModel.colorScheme.accent, lineWidth: 5) // Outline (border) color #3c3c6c
                            )
                    }
                    
                    // Game Simulation Button
                    NavigationLink(destination: GameSimulationView()) {
                        Text("Game Simulation")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(colorSchemeModel.colorScheme.D1) // Background color
                            .foregroundColor(colorSchemeModel.colorScheme.mainDetail) // Text color
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(colorSchemeModel.colorScheme.accent, lineWidth: 5) // Outline (border) color #3c3c6c
                            )
                    }
                    
                    // Bronco Trainer Button (disabled)
                    Button("Bronco Trainer") {
                        // TODO: Add functionality here
                    }
                    .font(.custom("NFPixels-Regular", size: 30))
                    .padding()
                    .background(Color.gray) // Background color #ccccd9
                    .foregroundColor(Color.white) // Text color #3c3c6c
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 5) // Outline (border) color #3c3c6c
                    )
                    
                    Text("Coming soon!")
                        .font(.custom("NFPixels-Regular", size: 20))
                    
                    Spacer()
                }
                .padding() // Add padding to avoid content getting too close to the edges
            }
            .overlay(
                RoundedRectangle(cornerRadius: 300) // Set cornerRadius to 0 to avoid rounding the frame
                    .stroke(colorSchemeModel.colorScheme.D3, lineWidth: 20) // Frame color #b42434
                    .clipShape(RoundedRectangle(cornerRadius: 30)) // Clip to the shape to ensure the corners are matched
                
                    .edgesIgnoringSafeArea(.all) // Ensure frame fills the entire screen
            )
        }
    }
}


#Preview {
    ContentView(colorSchemeModel: ColorSchemeModel())
}
