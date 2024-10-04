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
        var defaultDefensiveLinebreaks = 4 // ^ Increase Difficulty
        var defaultScrums = 6 // ^ Decrease Difficulty
        var defaultLineouts = 2 // ^ Decrease Difficulty
        var defaultOffensiveLinebreaks = 4 // ^ Increase Difficulty
        var tries = 3 // TODO: Make tries a random value? Not necessarily harder or easier. (Have to sprint, but you get a short break and water afterwards)
        var offense = false // More Offense = Less Difficulty
        
        let totalEvents = tries + defaultScrums + defaultLineouts
        
        var avgInterval = 420 / totalEvents
        
        print(avgInterval)
        
        /*
        if intensity == 1 {
            // 3 less defensive linebreaks
            defaultDefensiveLinebreaks -= 3
            
            // 3 more scrums
            defaultScrums += 3
            
            // 3 more lineouts
            defaultLineouts += 3
            
            // 2 less linebreaks
            defaultOffensiveLinebreaks -= 2
            
            
        }
        if intensity == 2 {
            
            
            
        }
         */
        
        // TODO: Space out events

        if intensity >= 3 && defaultDefensiveLinebreaks != 0 {
            print("Poach")
            
        }
        
        // TODO: Add timings
        
        
        // TODO: Add kickoff to the beginning of both arrays
        return [(0, "Kickoff"), (420, "Halftime"), (480, "Kickoff"), (900, "Full-time")]
        
    }
    
}
