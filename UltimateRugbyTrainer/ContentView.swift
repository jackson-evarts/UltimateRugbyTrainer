//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{ // Game Simulation Button
                
                
                Button("Game Simulation"){
                    path.append(GameSimulationView())
                    
                }
                
                /*
                 ZStack{
                 // Use UIColor to define a hex color
                 RoundedRectangle(cornerRadius: 5)
                 .fill(Color(UIColor(red: 101/255, green: 198/255, blue: 236/255, alpha: 1))) // Inside color
                 .frame(height: 100)
                 .frame(maxWidth: .infinity)
                 .overlay(
                 RoundedRectangle(cornerRadius: 5)
                 .stroke(Color(UIColor(red: 5/255, green: 117/255, blue: 162/255, alpha: 1)), lineWidth: 10) // Outline color
                 )
                 .padding(.horizontal, 20)
                 
                 Text("Game Simulation")
                 .foregroundColor(Color(UIColor(red: 5/255, green: 117/255, blue: 162/255, alpha: 1))) // Text color
                 .font(.custom("NFPixels-Regular", size: 40))
                 .bold()
                 .scaledToFit()
                 
                 } // Close ZStack for Game Simulation Button
                 
                 } // Close NavigationView (the Game Simulation Button)
                 
                 */
            }
        } // Close outer VStack
    
    }
}

#Preview {
    ContentView()
}
