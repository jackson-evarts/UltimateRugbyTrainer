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
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    @State var timerSpeed: Double = 1.0
    
    let images = ["running-1", "running-2", "running-3", "running-4"]
    
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
                    
                    Image(images[currentImageIndex])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
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
                .onAppear{
                    startTimer()
                }.onChange(of: intensity) { newValue in
                    startTimer() // Restart timer when intensity changes
                }
                .onDisappear {
                    timer?.invalidate() // Stop the timer when view disappears
                }
               
                .navigationTitle("Game Simulation")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }

    func startTimer() {
            // Invalidate any existing timer
            timer?.invalidate()
            
            // Set the timer speed based on intensity
            switch intensity {
            case 1:
                timerSpeed = 1.0
            case 2:
                timerSpeed = 0.7
            case 3:
                timerSpeed = 0.5
            case 4:
                timerSpeed = 0.3
            case 5:
                timerSpeed = 0.1
            default:
                timerSpeed = 1.0 // Fallback value
            }
            
            // Schedule a new timer
            timer = Timer.scheduledTimer(withTimeInterval: timerSpeed, repeats: true) { _ in
                // Update the index to the next image
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
    }
}

#Preview {
    GameSimulationView(colorSchemeModel: ColorSchemeModel())
}
