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
}

