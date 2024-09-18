//
//  GameSimulationView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct GameSimulationView: View{
    var body: some View {
        VStack{
            // TODO: Secondary menu title (7s Simulation)
            // here
            // TODO: Tutorial button nav to Tutorial Page
            
            // TODO: Intensity slider
            
            // TODO: Play button nav to gameplay screen
            
        }
        
    }
}


// STOPWATCH STUFF v DEINTEGRATED 20240918
/*
struct GameSimulationView: View {
    
    @ObservedObject var gameSimulationManager = GameSimulationViewManager()
    
    var body: some View {
        
        
        VStack {
            
            // This is the displayed text for the timer. TODO: Eventually may want to have a countdown to halftime instead of simply counting up.
            Text(String(format: "%.1f", gameSimulationManager.secondsElapsed))
                .font(.largeTitle)
                .padding(.top, 200)
                .padding(.bottom,100)
                .padding(.trailing,100)
                .padding(.leading,100)
            
            
            
            // The different buttons for the stopwatch view depending on the current state of the stopwatch. Ex: When it's stopped you can press start.
            if gameSimulationManager.timerState == .stopped {
                Button(action: {self.gameSimulationManager.start()}){
                    TimerButton(label: "Start", buttonColor: .yellow, textColor: .black)
                }
            }
            
            // Making the pause button harder to click (must triple click) so that you don't accidentally activate it in your pocket
            
            
            if gameSimulationManager.timerState == .running{
                TimerButton(label: "Pause", buttonColor: .yellow, textColor: .black)
                
                    // Must triple click to pause
                    .onTapGesture(count: 3){
                        self.gameSimulationManager.pause()
                    }
            }
            
            
            // When the stopwatch is paused, you can press start or stop, so there are two buttons
            if gameSimulationManager.timerState == .paused{
                Button(action: {self.gameSimulationManager.start()}){
                    TimerButton(label: "Start", buttonColor: .yellow, textColor: .black)
                }
                Button(action: {self.gameSimulationManager.stop()}){
                    TimerButton(label: "Stop", buttonColor: .red, textColor: .white)
                }
                .padding(.top, 30)
                
             
            }
            Spacer()
        }
        .navigationTitle("Game Simulation")
    }
}

*/

#Preview {
    GameSimulationView()
}

// STOPWATCH STUFF v DEINTEGRATED 20240918
/*
 struct TimerButton: View { // This allows for multiple instances of a TimerButton, so we can have 2 when the button is paused or a different color button for the Stop state.
 
 let label: String
 let buttonColor: Color
 let textColor: Color
 
 
 var body: some View {
 Text(label)
 .foregroundColor(textColor)
 .padding(.vertical, 20)
 .padding(.horizontal, 90)
 .background(buttonColor)
 .cornerRadius(10)
 }
 }
 */
