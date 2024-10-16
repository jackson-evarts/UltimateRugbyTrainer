//
//  PlayLogic.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/26/24.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation


class PlayLogic: ObservableObject {
    @Published var elapsedTime: Int = -5
    @State private var audioPlayer: AVAudioPlayer?
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
     Jackson Evarts (Outline)
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
    
    
    // Variable for testing other functionality besides buildGame
    let exampleBuild = [
        (0, "Kickoff"),
        (35, "Defensive Linebreak"),
        (74, "Scrum"),
        (115, "Offensive Linebreak"),
        (155, "Defensive Linebreak"),
        (195, "Scrum"),
        (240, "Lineout"),
        (285, "Try"),
        (320, "Offensive Linebreak"),
        (390, "Try"),
        (420, "Halftime"),
        (480, "Kickoff"),
        (515, "Scrum"),
        (550, "Defensive Linebreak"),
        (600, "Offensive Linebreak"),
        (640, "Lineout"),
        (680, "Try"),
        (715, "Scrum"),
        (770, "Offensive Linebreak"),
        (840, "Try"),
        (900, "Full-time")
    ]


    /*
     Precondition:
     --
     =====
     Postcondition:
     Audio is setup to play in the background and duck other audio
     */
    func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, options: [.mixWithOthers, .duckOthers]) // Allow mixing and ducking
            try audioSession.setActive(true) // Activate the session
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
    
    
    /*
     Precondition:
     The passed variable "sound" is a valid .m4a file inside the app folder.
     =====
     Postcondition:
     The correlated audio to the details passed is played for the user.
     =====
     Author:
     Jackson Evarts
     */
    func playSound(sound: String, type: String = ".m4a") {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
    
    /*
     Precondition:
     ???
     =====
     Postcondition:
     Each time the timer hits a time that is in the gameEvents array, I want the program to play the correlated sound associated with the string that is in the gameEvents array.
     
     */
    func eventManagement(gameEvents: [(Int, String)]) {
        var gameEventIndex = 0
        
        // Start a timer to check elapsedTime periodically
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let currentTime = self.elapsedTime
            
            // If all events are processed, invalidate the timer
            if gameEventIndex >= gameEvents.count {
                timer.invalidate()
                return
            }
            
            // Get the next event from the gameEvents array
            let nextEvent = gameEvents[gameEventIndex]
            
            // Check if the elapsed time matches the event time
            if currentTime >= nextEvent.0 {
                // Play the audio based on the event type
                self.playSound(sound: nextEvent.1)
                
                // Move to the next event in the array
                gameEventIndex += 1
            }
        }
    }
    
    
}
