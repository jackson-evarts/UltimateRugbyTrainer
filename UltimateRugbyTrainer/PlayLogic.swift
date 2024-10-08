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
    
    
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    
    /*
     Precondition: 
     The user has selected an intensity level (1-5) which is passed to this function as they click 'Play'
     =====
     Postcondition: 
     The function returns a list of tupils of type (Int, String) which represent timestamps of events in the game timeline such as the kickoff: (0, 'Kickoff')
     =====
     Author: 
     Jackson Evarts (Outline), ChatGPT (Base functionality)
     */
    
    func buildGame(intensity: Int) -> [(Int, String)] {
        
        // Adjustments based on intensity level (default for intensity 3)
        var defensiveLinebreaks = 4
        var scrums = 6
        var lineouts = 2
        var offensiveLinebreaks = 4
        let tries = Int.random(in: 2...4) // Randomize tries
        
        // Increase or decrease events based on intensity level
        switch intensity {
        case 1:
            defensiveLinebreaks -= 3
            scrums += 3
            lineouts += 2
            offensiveLinebreaks -= 2
        case 2:
            defensiveLinebreaks -= 2
            scrums += 2
            lineouts += 1
            offensiveLinebreaks -= 1
        case 4:
            defensiveLinebreaks += 2
            scrums -= 1
            lineouts -= 1
            offensiveLinebreaks += 2
        case 5:
            defensiveLinebreaks += 3
            scrums -= 2
            lineouts -= 1
            offensiveLinebreaks += 3
        default:
            break
        }
        
        // Total number of events for each half (420 seconds)
        let totalEvents = defensiveLinebreaks + scrums + lineouts + offensiveLinebreaks + tries
        let avgInterval = 420 / totalEvents
        
        // Initialize the timeline with kickoff events
        var timeline: [(Int, String)] = [(0, "Kickoff")]
        
        // Populate the timeline with game events, spaced out
        var currentTime = 0
        
        // Add events based on calculated intervals
        for _ in 1...defensiveLinebreaks {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Defensive Linebreak"))
        }
        
        for _ in 1...scrums {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Scrum"))
        }
        
        for _ in 1...lineouts {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Lineout"))
        }
        
        for _ in 1...offensiveLinebreaks {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Offensive Linebreak"))
        }
        
        for _ in 1...tries {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Try"))
        }
        
        // Add halftime and second-half kickoff
        timeline.append((420, "Halftime"))
        timeline.append((480, "Kickoff"))
        
        // Second half repeats the same process
        currentTime = 480
        for _ in 1...defensiveLinebreaks {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Defensive Linebreak"))
        }
        
        for _ in 1...scrums {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Scrum"))
        }
        
        for _ in 1...lineouts {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Lineout"))
        }
        
        for _ in 1...offensiveLinebreaks {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Offensive Linebreak"))
        }
        
        for _ in 1...tries {
            currentTime += Int.random(in: avgInterval - 10...avgInterval + 10)
            timeline.append((currentTime, "Try"))
        }
        
        // End the game at full-time
        timeline.append((900, "Full-time"))
        
        return timeline.sorted { $0.0 < $1.0 } // Return sorted timeline by time
    }
    
}
