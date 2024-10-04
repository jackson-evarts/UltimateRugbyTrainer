//
//  SettingsView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/3/24.
//

import SwiftUI

class ColorSchemeModel: ObservableObject {
    @Published var colorScheme: ColorSchemeProtocol
    
    init(colorScheme: ColorSchemeProtocol = USAColors()) {
        self.colorScheme = colorScheme
    }
}

// Define a protocol for the color scheme
protocol ColorSchemeProtocol {
    var D1: Color { get }
    var D2: Color { get }
    var D3: Color { get }
    var D4: Color { get }
    var D5: Color { get }
}

// Conform USAColors to ColorSchemeProtocol
struct USAColors: ColorSchemeProtocol {
    var D1 = Color.white
    var D2 = Color(UIColor(red: 133/255, green: 133/255, blue: 164/255, alpha: 1))  // #8585a4
    var D3 = Color(UIColor(red: 116/255, green: 112/255, blue: 148/255, alpha: 1))  // #747094
    
    //var mainDetail = Color(UIColor(red: 204/255, green: 204/255, blue: 217/255, alpha: 1))  // #ccccd9
    var D4 = Color(UIColor(red: 60/255, green: 60/255, blue: 108/255, alpha: 1))  // #3c3c6c
    var D5 = Color(UIColor(red: 180/255, green: 36/255, blue: 52/255, alpha: 1))  // #b42434
}

// Conform SAColors to ColorSchemeProtocol
struct SAColors: ColorSchemeProtocol {
    var D1 = Color(UIColor(red: 247/255, green: 241/255, blue: 192/255, alpha: 1))  // #f7f1c0
    var D2 = Color(UIColor(red: 232/255, green: 208/255, blue: 125/255, alpha: 1))  // #e8d07d
    var D3 = Color(UIColor(red: 196/255, green: 159/255, blue: 63/255, alpha: 1))  // #c49f3f
    var D4 = Color(UIColor(red: 150/255, green: 160/255, blue: 102/255, alpha: 1))  // #96a066
    var D5 = Color(UIColor(red: 50/255, green: 85/255, blue: 52/255, alpha: 1))  // #325534
    
    
}


struct SettingsView: View {
    @ObservedObject var colorSchemeModel: ColorSchemeModel
    
    // Create instances of USAColors and SAColors to access their properties
    let usaColors = USAColors()
    let saColors = SAColors()
    
    var body: some View {
        ZStack{
            /*
             Color.
             .edgesIgnoringSafeArea(.all) // Fill entire background
             */
            
            VStack {
                Text("Select Color Scheme")
                    .font(.title)
                    .padding()
                
                Button("USA Color Scheme") {
                    colorSchemeModel.colorScheme = USAColors() // Set USA colors
                }
                .font(.custom("NFPixels-Regular", size: 30))
                .padding()
                .background(usaColors.D2) // Background color
                .foregroundColor(usaColors.D1) // Text color
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(usaColors.D3, lineWidth: 5) // Outline (border) color
                )
                .padding(.bottom)
                
                
                Button("SA Color Scheme") {
                    colorSchemeModel.colorScheme = SAColors() // Set SA colors
                }
                .font(.custom("NFPixels-Regular", size: 30))
                .padding()
                .background(saColors.D2) // Background color
                .foregroundColor(saColors.D1) // Text color
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(saColors.D3, lineWidth: 5) // Outline (border) color
                )
                
                Spacer()
            }
            
            // Rectangle().foregroundColor(saColors.D4)
        }
    }
}


#Preview {
    SettingsView(colorSchemeModel: ColorSchemeModel())
}
