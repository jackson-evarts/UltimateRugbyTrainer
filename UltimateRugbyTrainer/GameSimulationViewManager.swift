//
//  GameSimulationViewManager.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/7/24.
//

import Foundation
import SwiftUI

// Must be an ObservableObject so that the derived values from this class can update the GameSimulationView
class GameSimulationViewManager: ObservableObject {
    
    
    
    // STOPWATCH STUFF v DEINTEGRATED 20240918
    /*
    enum timerMode{
        case running
        case stopped
        case paused
        
    }
    @Published var timerState: timerMode = .stopped
    
    // The "@Published" property wrapper tells all observing views to reload themselves whenver secondsElapsed changes
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    func start(){
        timerState = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
            timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func pause(){
        timer.invalidate()
        timerState = .paused
    }
    
    func stop(){
        timer.invalidate()
        secondsElapsed = 0
        timerState = .stopped
    }
     */
    
    
}
