//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack() {
            VStack {
                // Button to navigate to GameSimulationView
                ZStack{
                    Text("Ultimate")
                        .font(.custom("NFPixels-Regular", size: 105))
                        .foregroundColor(Color(UIColor(red: 101/255, green: 198/255, blue: 236/255, alpha: 1)))
                    Text("Ultimate")
                        .font(.custom("NFPixels-Regular", size: 100))
                        .foregroundColor(Color(UIColor(red: 204/255, green: 153/255, blue: 173/255, alpha: 1)))
                }
                ZStack{
                    Text("Rugby")
                        .font(.custom("NFPixels-Regular", size: 105))
                        .foregroundColor(Color(UIColor(red: 204/255, green: 153/255, blue: 173/255, alpha: 1)))
                    Text("Rugby")
                        .font(.custom("NFPixels-Regular", size: 100))
                        .foregroundColor(Color(UIColor(red: 101/255, green: 198/255, blue: 236/255, alpha: 1)))
                }
                ZStack{
                    Text("Trainer")
                        .font(.custom("NFPixels-Regular", size: 105))
                        .foregroundColor(Color(UIColor(red: 101/255, green: 198/255, blue: 236/255, alpha: 1)))
                    Text("Trainer")
                        .font(.custom("NFPixels-Regular", size: 100))
                        .foregroundColor(Color(UIColor(red: 204/255, green: 153/255, blue: 173/255, alpha: 1)))
                }
                
                Spacer()
                NavigationLink(destination: GameSimulationView()){
                    
                    Text("Game Simulation")
                        .font(.custom("NFPixels-Regular", size: 30))
                        .padding()
                        .background(Color(UIColor(red: 5/255, green: 117/255, blue: 162/255, alpha: 1)))
                    
                        .foregroundColor(Color(red: 101/255, green: 198/255, blue: 236/255))
                        .cornerRadius(10)
                        .border(Color(red: 101/255, green: 198/255, blue: 236/255), width: 5)
                    
                }
                Button("Bronco Trainer") {
                    // TODO: Make it so after 20 clicks the button doesn't click anymore
                    // TODO: Match style of Game Simulation button
                }
                .font(.custom("NFPixels-Regular", size: 30))
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                .border(Color.white, width: 5)
                Text("Coming soon!")
                    .font(.custom("NFPixels-Regular", size: 20))
                
                
                Spacer()
                
                
            }
            .navigationTitle("Main Menu")
            
            // TODO: Background
            
            // Define the navigation destinations based on the path

        } // End navigation logic
    }
}



#Preview {
    ContentView()
}
