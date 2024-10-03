//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color(UIColor(red: 133/255, green: 133/255, blue: 164/255, alpha: 1)) // Background color #8585a4
                    .edgesIgnoringSafeArea(.all) // Fill entire background

                VStack {
                    // Display the image
                    Image("title") // Refer to the image by its name in the assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .padding()

                    Spacer()
                    
                    // Game Simulation Button
                    NavigationLink(destination: GameSimulationView()) {
                        Text("Game Simulation")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(Color(UIColor(red: 204/255, green: 204/255, blue: 217/255, alpha: 1))) // Background color #ccccd9
                            .foregroundColor(Color(UIColor(red: 60/255, green: 60/255, blue: 108/255, alpha: 1))) // Text color #3c3c6c
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(UIColor(red: 60/255, green: 60/255, blue: 108/255, alpha: 1)), lineWidth: 5) // Outline (border) color #3c3c6c
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
                RoundedRectangle(cornerRadius: 50) // Set cornerRadius to 0 to avoid rounding the frame
                    .stroke(Color(UIColor(red: 180/255, green: 36/255, blue: 52/255, alpha: 1)), lineWidth: 5) // Frame color #b42434
                    .clipShape(RoundedRectangle(cornerRadius: 30)) // Clip to the shape to ensure the corners are matched

                    .edgesIgnoringSafeArea(.all) // Ensure frame fills the entire screen
            )
        }
    }
}


#Preview {
    ContentView()
}
