//
//  PlayLogic.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/26/24.
//

import Foundation
import SwiftUI
import Combine

class PlayLogic: ObservableObject {
    @Published var elapsedTime: Int = 0
    
    // TODO: Bring intensity slider selection here
    
    var timer: Timer?

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.elapsedTime += 1
        }
    }
    

    
    // TODO: Create default game-timelines / arrays for each intensity
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    func buildGame(intensity: Int) -> [(Int, String)] {
        
        // Default values will be for intensity 3. Values will be for each half.
        var defaultDefensiveLinebreaks = 4
        var defaultScrums = 6
        var defaultLineouts = 2
        var defaultOffensiveLinebreaks = 4
        var tries = 4
        
        
        // TODO: Space out events
        
        
        
        // TODO: Add timings
        
        
        // TODO: Add kickoff to the beginning of both arrays
        return [(0, "Kickoff"), (420, "Halftime"), (480, "Kickoff"), (900, "Full-time")]
        
    }
    
}

