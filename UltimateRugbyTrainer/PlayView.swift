//
//  PlayView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/25/24.
//

import SwiftUI

struct PlayView: View {
    var intensity: Int
    @ObservedObject var colorSchemeModel: ColorSchemeModel
    @ObservedObject var playLogic = PlayLogic()
    @State private var backgroundColor: Color = .clear // Initialize with a default value (e.g., .clear)
    
    @Environment(\.dismiss) var dismiss // Used to help navigate back on triple click
    
    
    
    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack{
                
                var formattedTime: String {
                    let minutes = playLogic.elapsedTime / 60
                    let seconds = playLogic.elapsedTime % 60
                    return String(format: "%02d:%02d", minutes, seconds) // Format as MM:SS
                }
                
                Text("Elapsed Time: \(formattedTime)")
                    .foregroundColor(.white)
                
                // TODO: Display what half it is. Do not show time left in half!
                Text("Triple Tap to Return to Menu")
                    .foregroundColor(.white)
                
                Text("Intensity: \(intensity)")
                    .foregroundColor(.white)
            }
            .onAppear{ // Start the timer immediately as the screen is brought up
                playLogic.startTimer()
            }
            .onDisappear(){ // Timer stops when the view is put away
                playLogic.stopTimer()
            }
            
            
        }
        .onAppear {
            // Animate the color change to black when the view appears
            backgroundColor = colorSchemeModel.colorScheme.D2
            
            withAnimation(.easeInOut(duration: 3)) {
                backgroundColor = Color.black
            }
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture(count: 3) { // Detect triple tap
            dismiss() // Navigate back on triple tap
            playLogic.stopTimer()
            playLogic.elapsedTime = 0
        }
    }
    
}

#Preview {
    PlayView(intensity: 3, colorSchemeModel: ColorSchemeModel())
}
