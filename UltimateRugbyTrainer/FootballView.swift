//
//  FootballView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/9/24.
//
// most recently modified by Joseph Townsend on 10/23/24

import SwiftUI
import AVFoundation

struct FootballView: View {
    @State private var selectedUnit: String = "Offense" // Default selection
    @State private var selectedTime: Int = 5 // Default time is 5 minutes
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Black background filling the entire screen
                Color.black
                    .edgesIgnoringSafeArea(.all) // Fill entire background
                
                VStack {
                    // "Hello, Future NFL Star!" text at the top
                    Text("Hello, Future NFL Star!")
                        .font(.custom("NFPixels-Regular", size: 40))
                        .foregroundColor(.neonBlue) // Neon blue text
                        .padding(.top, 20) // Adds space at the top
                    
                    Image("GameSimTitle") // Refer to the image by its name in the assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Spacer()
                    
                    // Unit Selection
                    Text("Choose your Unit")
                        .font(.custom("NFPixels-Regular", size: 30))
                        .foregroundColor(.neonBlue) // Neon blue text
                    
                    VStack(spacing: 20) {
                        // Offense Button
                        Button(action: {
                            selectedUnit = "Offense"
                        }) {
                            Text("Offense")
                                .font(.custom("NFPixels-Regular", size: 25))
                                .padding()
                                .frame(maxWidth: .infinity) // Fill horizontally
                                .background(selectedUnit == "Offense" ? Color.neonBlue : Color.silver)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }

                        // Defense Button
                        Button(action: {
                            selectedUnit = "Defense"
                        }) {
                            Text("Defense")
                                .font(.custom("NFPixels-Regular", size: 25))
                                .padding()
                                .frame(maxWidth: .infinity) // Fill horizontally
                                .background(selectedUnit == "Defense" ? Color.neonBlue : Color.silver)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        
                        // Special Teams - Greyed out
                        VStack {
                            Text("Special Teams")
                                .font(.custom("NFPixels-Regular", size: 25))
                                .padding()
                                .frame(maxWidth: .infinity) // Fill horizontally
                                .background(Color.gray) // Greyed out background
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Text("Coming Soon")
                                .font(.custom("NFPixels-Regular", size: 15))
                                .foregroundColor(.gray) // Small greyed-out text
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // Time Selection
                    Text("Select Time")
                        .font(.custom("NFPixels-Regular", size: 30))
                        .foregroundColor(.neonBlue) // Neon blue text
                    
                    Picker("Time", selection: $selectedTime) {
                        Text("2 Minutes").tag(2)
                        Text("5 Minutes").tag(5)
                        Text("10 Minutes").tag(10)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 30)
                    .background(Color.silver) // Silver background for Picker
                    .cornerRadius(10)
                    .padding()
                    
                    // Play Button
                    NavigationLink(destination: PlayFBView(unit: selectedUnit, time: selectedTime)) {
                        Text("Play as \(selectedUnit) for \(selectedTime) minutes")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .padding()
                            .frame(maxWidth: .infinity) // Fill horizontally
                            .background(Color.neonBlue) // Neon blue button background
                            .foregroundColor(.black) // Black text inside the button
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.silver, lineWidth: 5) // Silver border
                            )
                            .padding()
                    }
                    
                    Spacer()
                }
                .navigationTitle("Game Simulation")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(.silver) // Silver default text color
            }
        }
    }
}

struct PlayFBView: View {
    var unit: String // The selected unit passed in
    var time: Int // The selected time passed in

    @State private var remainingTime: Int // Remaining time in seconds
    @State private var timer: Timer? // Timer object
    @State private var sessionDone = false // Flag to track session completion
    @State private var nextInterval: Int = 10 // The next interval for updates
    @State private var selectedPlay: String = "" // Selected play from the list
    @State private var selectedSubtype: String = "" // Selected subtype based on play
    @State private var selectedNumber: String = "" // Selected number or blitz type
    @State private var timeSinceLastCall: Int = 0 // Tracks time since the last play call

    // Offense arrays and dictionaries
    let numberOptions = [5, 10, 20, 35, 45]
    let playOptions = [
        "Inside Run",
        "Outside Run",
        "Quick 3-Step Pass",
        "Medium 5-Step Pass",
        "Deep 5-Step Pass"
    ]
    let intervals = [10, 15, 20]
    let playSubtypes: [String: [String]] = [
        "Inside Run": ["Inside Zone", "Trap"],
        "Outside Run": ["Midzone", "Pitch", "Jet Sweep", "Power"],
        "Quick 3-Step Pass": ["Slant", "Hitch", "Speed Out", "Screen"],
        "Medium 5-Step Pass": ["Dig", "Out", "Curl", "Comeback"],
        "Deep 5-Step Pass": ["Post", "Corner", "Fade", "Stutter"]
    ]

    // Defense arrays and dictionaries
    let defensiveStyles = ["Man", "Zone"]
    let zoneTypes = ["Cover 4", "Cover 3", "Cover 2"]
    let gaps = ["A Gap", "B Gap", "C Gap", "D Gap"]

    init(unit: String, time: Int) {
        self.unit = unit
        self.time = time
        _remainingTime = State(initialValue: time * 60) // Convert minutes to seconds
    }

    var body: some View {
        ZStack {
            Color.black // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background

            if sessionDone {
                SessionDoneView() // Show session done view
            } else {
                VStack {
                    Spacer()

                    // Timer display
                    Text("\(remainingTime / 60) : \(String(format: "%02d", remainingTime % 60))")
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(.red)
                        .padding()

                    if unit == "Offense" || unit == "Defense" {
                        // Display for both offense and defense
                        Text("Play: \(selectedPlay)")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()

                        Text("Subtype: \(selectedSubtype)")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding()

                        Text("Details: \(selectedNumber)")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }

                    Spacer()
                }
            }
        }
        .onAppear(perform: startTimer)
        .onDisappear(perform: stopTimer)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
                timeSinceLastCall += 1

                let isTwoMinuteDrill = (unit == "Defense" && time == 2) || (unit == "Offense" && time == 2)
                let intervalLimit = isTwoMinuteDrill ? 8 : nextInterval

                if timeSinceLastCall >= intervalLimit {
                    updateRandomSelection()
                    timeSinceLastCall = 0

                    nextInterval = isTwoMinuteDrill ? Int.random(in: 8...10) : (intervals.randomElement() ?? 10)
                }
            } else {
                sessionDone = true
                stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func updateRandomSelection() {
        if unit == "Offense" {
            // Pick random offensive play and number
            selectedPlay = playOptions.randomElement() ?? ""
            selectedNumber = "\(numberOptions.randomElement() ?? 0)"

            // Pick a random subtype based on the selected play
            if let subtypes = playSubtypes[selectedPlay] {
                selectedSubtype = subtypes.randomElement() ?? ""
            } else {
                selectedSubtype = ""
            }
        } else if unit == "Defense" {
            // Pick random defensive play
            selectedPlay = defensiveStyles.randomElement() ?? ""


            // Decide on blitz or no blitz
            let blitzDecision = Bool.random()
            if blitzDecision {
                // Blitz: Choose 1 or 2 gaps for execution
                let blitzCombination = Int.random(in: 1...2)
                let selectedGaps = (0..<blitzCombination).map { _ in gaps.randomElement() ?? "" }
                selectedNumber = selectedGaps.joined(separator: " + ")
                selectedSubtype = "Blitz!"
            } else {
                // No Blitz
                selectedNumber = "No Blitz"
                selectedSubtype = "No Blitz"
            }
        }
    }
}

struct SessionDoneView: View {
    var body: some View {
        VStack {
            // Flashing effect using animation
            Text("Done")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(.neonBlue)
                .padding()
                .opacity(0.0)
                .animation(
                    Animation.linear(duration: 0.5)
                        .repeatForever(autoreverses: true),
                    value: 1
                )
                .onAppear {
                    withAnimation {
                        // This triggers the flashing effect
                        _ = 1
                    }
                }
            
            // Navigation Buttons
            HStack {
                NavigationLink("Return to Selection", destination: FootballView())
                    .padding()
                    .background(Color.neonBlue)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                NavigationLink("Finish", destination: FinishView())
                    .padding()
                    .background(Color.neonBlue)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.top, 30) // Space above the buttons
            Spacer()
        }
        .background(Color.black) // Black background for SessionDoneView
        .edgesIgnoringSafeArea(.all)
    }
}

// Placeholder for FinishView
struct FinishView: View {
    var body: some View {
        Text("Workout Complete!")
            .font(.largeTitle)
            .foregroundColor(.neonBlue)
            .padding()
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    FootballView()
}

// Custom colors
extension Color {
    static let neonBlue = Color(red: 0.0, green: 1.0, blue: 1.0) // Neon blue
    static let silver = Color(red: 0.75, green: 0.75, blue: 0.75) // Silver
}
