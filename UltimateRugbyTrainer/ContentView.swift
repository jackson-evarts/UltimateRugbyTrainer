//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {

    /*
     Color Scheme:
     Color.white
     Color.lightBlueUSA
     Color.midBlueUSA
     Color.darkBlueUSA
     Color.redUSA
     */
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color filling the entire screen
                Color.lightBlueUSA // Background color
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    
                    // Display the image
                    ZStack{
                        Image("title") // Refer to the image by its name in the assets
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 200)
                        Image("title") // Refer to the image by its name in the assets
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 200)
                            .offset(CGSize(width: 5.0, height: 5.0))
                            .opacity(0.5)
                        
                    }
                        
                    Image("Rugby Ball")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    
                    // Settings Button
                    NavigationLink(destination: SettingsView()) {
                        PixelTextForButton(label: "Settings")
                    }
                    
                    
                    
                    // Game Simulation Button
                    NavigationLink(destination: GameSimulationView()) {
                        PixelTextForButton(label: "Game Simulation")
                        
                    }
                    
                    // Bronco Trainer Button (disabled)
                    PixelTextForButton(label: "Bronco", backgroundColor: .gray, outlineColor: .white, textColor: .white)
                    
                    Text("Coming soon!")
                        .font(.custom("NFPixels-Regular", size: 20))
                        .foregroundColor(.white)
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
    ContentView()
}
