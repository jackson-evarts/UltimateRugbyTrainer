//
//  BasketballView.swift
//  UltimateRugbyTrainer
//
//  Created by Joseph Townsend on 11/13/24.
//

import SwiftUI

struct BasketballView: View {
    @State private var selectedUnit: String = "Offense" // Default selection
       
       var body: some View {
           NavigationStack {
               ZStack {
                   // Background resembling a basketball court (beige)
                   Color(UIColor(red: 0.96, green: 0.91, blue: 0.76, alpha: 1.0)) // Light beige background
                       .edgesIgnoringSafeArea(.all)
                   
                   VStack {
                       // Greeting text
                       Text("Hello, Future NBA Star!")
                           .font(.custom("Impact", size: 38))
                           .foregroundColor(.basketballOrange) // Orange text
                           .padding(.top, 20)
                       
                       Image("kobepic") 
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .padding()
                       
                       Spacer()
                       
                       // Unit Selection
                       Text("Choose Your Play Style")
                           .font(.custom("NFPixels-Regular", size: 30))
                           .foregroundColor(.basketballOrange)
                       
                       Picker("Unit", selection: $selectedUnit) {
                           Text("Offense").tag("Offense")
                           Text("Defense").tag("Defense")
                       }
                       .pickerStyle(SegmentedPickerStyle())
                       .padding(.horizontal, 30)
                       .background(Color(UIColor(red: 0.9, green: 0.6, blue: 0.4, alpha: 1.0))) // Basketball court color
                       .cornerRadius(10)
                       .padding(.bottom, 30)
                       
                       // Play Button
                       NavigationLink(destination: PlayBBView(unit: selectedUnit)) {
                           Text("Coming Soon!")
                               .font(.custom("NFPixels-Regular", size: 30))
                               .padding()
                               .frame(maxWidth: .infinity) // Fill horizontally
                               .background(Color.gray)
                               .foregroundColor(.black)
                               .cornerRadius(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color.basketballBeige, lineWidth: 5) // Beige border
                               )
                               .padding()
                       }
                       
                       Spacer()
                   }
                   .navigationTitle("Basketball Simulation")
                   .navigationBarTitleDisplayMode(.inline)
                   .foregroundColor(.basketballBeige) // Default text color
               }
           }
       }
   }

   struct PlayBBView: View {
       var unit: String // The selected unit passed in
       
       var body: some View {
           ZStack {
               Color.black // Background color
                   .edgesIgnoringSafeArea(.all) // Fill entire background
               
               VStack {
                   Text("Playing as \(unit)")
                       .font(.largeTitle)
                       .foregroundColor(.basketballOrange)
                       .padding()
                   
                   Spacer()
                   
                   Text("Game Simulation for \(unit)")
                       .font(.title)
                       .foregroundColor(.basketballBeige)
                       .padding()
                   
                   Spacer()
               }
           }
       }
   }

   #Preview {
       BasketballView()
   }

   // Custom colors for basketball theme
   extension Color {
       static let basketballOrange = Color(UIColor(red: 0.91, green: 0.41, blue: 0.17, alpha: 1.0)) // Basketball orange
       static let basketballBeige = Color(UIColor(red: 0.96, green: 0.91, blue: 0.76, alpha: 1.0)) // Light beige
   }
