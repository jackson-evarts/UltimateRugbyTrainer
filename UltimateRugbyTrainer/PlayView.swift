//
//  PlayView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/25/24.
//

import SwiftUI
import AVFoundation
import Combine



struct PlayView: View {
    
    var intensity: Int
    @State private var backgroundColor: Color = .clear // Initialize with a default value (e.g., .clear)
    @State private var elapsedTime: Int = -5
    @State private var audioPlayer: AVAudioPlayer?
    @State private var timer: Timer?

    @Environment(\.dismiss) var dismiss // Used to help navigate back on triple click
    
    
    
    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack{
                
                var formattedTime: String {
                    let minutes = elapsedTime / 60
                    let seconds = elapsedTime % 60
                    return String(format: "%02d:%02d", minutes, seconds) // Format as MM:SS
                }
                
                Text("Elapsed Time: \(formattedTime)")
                    .foregroundColor(.white)
                
                Text("Triple Tap to Return to Menu")
                    .foregroundColor(.white)
                
                Text("Intensity: \(intensity)")
                    .foregroundColor(.white)
            }
            
        }
        .onAppear {
            // Start the timer immediately as the screen is brought up
            startTimer()
            setupAudioSession()
            
            // Building the game and calling eventManagement function to play audios
            var gameList = buildGame(intensity: intensity)
            eventManagement(gameEvents: gameList)
            print("The game: \(gameList)")
        
        
            // Animate the color change to black when the view appears
            backgroundColor = Color.lightBlueUSA
            withAnimation(.easeInOut(duration: 3)) {
                backgroundColor = Color.black
            }
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture(count: 3) { // Detect triple tap
            dismiss() // Navigate back on triple tap
            stopTimer()
            elapsedTime = -5
        }
        
        
        .onDisappear(){ // Timer stops when the view is put away
            stopTimer()
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
    func playSound(sound: String, type: String = "m4a") {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            print("Path found: \(path)") // Check if this is the correct path
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                print("\(sound) sound should play now.")

            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found: \(sound).\(type)")
        }
    }
    
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
                
                // TODO: Uncomment this. Testing audio player.
                playSound(sound: nextEvent.1)
                
                // Move to the next event in the array
                gameEventIndex += 1
            }
        }
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
            timeline.append((currentTime, "DefensiveLinebreak"))
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
            timeline.append((currentTime, "OffensiveLinebreak"))
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

#Preview {
    PlayView(intensity: 3)
}
