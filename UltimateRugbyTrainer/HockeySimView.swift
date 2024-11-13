//
//  HockeySimView.swift
//  UltimateRugbyTrainer
//
//  Created by Mikas Marinos on 11/13/24.
//

import SwiftUI

struct HockeySimView: View {
    
    @State private var intensity: Double = 1.0
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    @State var timerSpeed: Double = 1.0
    
    let images = ["Hockey Skating", "Hockey Skating (1)", "Hockey Skating (2)", "Hockey Skating (3)", "Hockey Skating", "Hockey Skating (5)", "Hockey Skating (6)", "Hockey Skating (7)", "Hockey Skating (8)", "Hockey Skating (9)", "Hockey Skating (10)" ]

    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                // Background color filling the entire screen
                backgroundColor
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    
                    /*
                     Text("Game Simulation")
                     .font(.largeTitle)
                     .padding()
                     */
                    ZStack{
                        Text("Game Simulation")
                            .font(.custom("NFPixels-Regular", size: 50))
                            .foregroundColor(.black)
                            .offset(CGSize(width: 3.0, height: 3.0))
                            .opacity(0.5)
                        Text("Game Simulation")
                            .font(.custom("NFPixels-Regular", size: 50))
                            .foregroundColor(.blue)
                    }
                    
                   
                    if intensity == 5{
                        Image("grave")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        HStack{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                            Text("Warning:")
                                .font(.custom("NFPixels-Regular", size: 25))
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        Text("Devolpers Do Not Take Responsiblity for Death")
                            .font(.custom("NFPixels-Regular", size: 18))
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                        
                    } else {
                        Image(images[currentImageIndex])
                            .resizable()
                            .scaledToFit()
                            .mask(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.3)]), startPoint: .bottom, endPoint: .top))
                                    
                    }
                   
                    Spacer()
                    
                    Text("Intensity") // Display current intensity as an integer
                        .font(.custom("NFPixels-Regular", size: 30))
                        .foregroundColor(.black)
                    
                    
                    
                    HockeyBouncingSlider(value: $intensity)
                        .padding(.horizontal, 30)
                    
                    NavigationLink(destination: PlayView(intensity: Int(intensity))){
                        Text("Play at Intensity \(Int(intensity))")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(buttonColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 5)
                            )
                            .padding()
                    }
                    
                    // Button to navigate to TutorialView
                    NavigationLink(destination: TutorialView()){
                        Text("Tutorial")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .background(buttonColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 5)
                            )
                    }
                    
                    Spacer()
                }
                .onAppear{
                    startTimer()
                }.onChange(of: intensity) {
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
                timerSpeed = 0.3
            case 2:
                timerSpeed = 0.2
            case 3:
                timerSpeed = 0.1
            case 4:
                timerSpeed = 0.07
            default:
                timerSpeed = 0.3 // Fallback value
            }
            
            // Schedule a new timer
            timer = Timer.scheduledTimer(withTimeInterval: timerSpeed, repeats: true) { _ in
                // Update the index to the next image
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
    }
}
#Preview {
    HockeySimView()
}
