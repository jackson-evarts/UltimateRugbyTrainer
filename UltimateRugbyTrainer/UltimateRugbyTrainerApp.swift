//
//  UltimateRugbyTrainerApp.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

@main
struct UltimateRugbyTrainerApp: App {
    var colorSchemeModel = ColorSchemeModel()

    var body: some Scene {
        WindowGroup {
            ContentView(colorSchemeModel: colorSchemeModel)
        }
    }
}
