//
//  PlayView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/25/24.
//

import SwiftUI

struct PlayView: View {
    @ObservedObject var playLogic = PlayLogic()
    var intensity: Int
    
    var body: some View {
        VStack{
            Text("Elapsed Time: \(playLogic.elapsedTime)")
            // TODO: Display what half it is. Do not show time left in half!
            Text("Triple Tap to Pause")
            Text("Intensity: \(intensity)")
        }
        .onAppear{ // Start the timer immediately as the screen is brought up
            playLogic.startTimer()
            
        }
        .onDisappear(){ // Timer stops when the view is put away
            playLogic.stopTimer()
            
        }
    }
}

#Preview {
    PlayView(intensity: 3)
}
