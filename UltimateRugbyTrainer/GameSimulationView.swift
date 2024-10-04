//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI


// THIS STRUCT WAS MADE BY CHATGPT circa 20241003
struct BouncingSlider: View {
    @Binding var value: Double // The current value of the slider (1-5)
    @ObservedObject var colorSchemeModel: ColorSchemeModel
    
    var range: ClosedRange<Double> = 1...5 // Default range from 1 to 5
    var step: Double = 1 // Slider step size
    
    var thumbSize: CGFloat = 20 // Size of the thumb
    
    
    
    @State private var isDragging: Bool = false // To track if the user is dragging
    
    var body: some View {
        GeometryReader { geometry in
            let sliderWidth = geometry.size.width - thumbSize // Width of the track minus the thumb's width
            let thumbPosition = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * sliderWidth
            
            ZStack(alignment: .leading) {
                // Track background
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(height: 6)
                    .cornerRadius(3)
                
                // Filled track
                Rectangle()
                    .fill(colorSchemeModel.colorScheme.D5)
                    .frame(width: thumbPosition + thumbSize / 2, height: 6)
                    .cornerRadius(3)
                
                // Thumb (draggable)
                Circle()
                    .fill(colorSchemeModel.colorScheme.D5)
                    .frame(width: thumbSize, height: thumbSize)
                    .overlay(
                        Circle().stroke(colorSchemeModel.colorScheme.D4, lineWidth: 3.5) // Add border to thumb
                    )
                    .offset(x: thumbPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                // Calculate new value based on drag position
                                let newValue = min(max(gesture.location.x / sliderWidth * (range.upperBound - range.lowerBound) + range.lowerBound, range.lowerBound), range.upperBound)
                                value = newValue
                                isDragging = true
                            }
                            .onEnded { _ in
                                // Snap to nearest value and animate
                                withAnimation(.interpolatingSpring(stiffness: 300, damping: 10)) {
                                    value = round(value / step) * step // Snap to nearest step
                                }
                                isDragging = false
                            }
                    )
            }
            .padding(.horizontal, thumbSize / 2) // Padding to keep thumb within bounds
        }
        .frame(height: 40) // Height of the slider
    }
}


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
                    
                    NavigationLink(destination: PlayView(intensity: Int(intensity), colorSchemeModel: ColorSchemeModel())){
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
