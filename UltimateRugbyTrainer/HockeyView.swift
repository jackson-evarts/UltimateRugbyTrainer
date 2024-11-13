//
//  HockeyView.swift
//  UltimateRugbyTrainer
//
//  Created by Mikas Marinos on 11/13/24.
//

import SwiftUI

var backgroundColor = Color(red: 209/255, green: 229/255, blue: 244/255)
var buttonColor = Color(red: 174/255, green: 204/255, blue: 255/255)

struct HockeyView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                backgroundColor
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("Ultimate Hockey")
                            .font(.custom("NFPixels-Regular", size: 50))
                            .foregroundColor(.black)
                            .offset(CGSize(width: 3.0, height: 3.0))
                            .opacity(0.5)
                        Text("Ultimate Hockey")
                            .font(.custom("NFPixels-Regular", size: 50))
                            .foregroundColor(.blue)
                    }
                    ZStack{
                        Text("Trainer")
                            .font(.custom("NFPixels-Regular", size: 50))
                            .foregroundColor(.black)
                            .offset(CGSize(width: 3.0, height: 3.0))
                            .opacity(0.5)
                        Text("Trainer")
                            .font(.custom("NFPixels-Regular", size: 50))
                            .foregroundColor(.blue)
                    }
                    ZStack{
                        Image("HockeyRink")
                            .resizable()
                            .scaledToFit()
                        Image("HockeyPlayer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .offset(CGSize(width: 0.0, height: -50.0))
                        
                    }
                    
                    NavigationLink(destination: HockeySimView()){
                        Text("Game Simulation")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .foregroundColor(.white)             // Custom text color
                            .padding()                           // Custom padding
                            .background(buttonColor)              // Custom background color
                            .cornerRadius(10)                    // Rounded corners
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 5)
                            )
                    }
                    
                    NavigationLink(destination: SettingsView()){
                        Text("Settings")
                            .font(.custom("NFPixels-Regular", size: 30))
                            .foregroundColor(.white)             // Custom text color
                            .padding()                           // Custom padding
                            .background(buttonColor)              // Custom background color
                            .cornerRadius(10)                    // Rounded corners
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 5)
                            )
                    }
                }
                
            }
        }
    }
}

#Preview {
    HockeyView()
}
