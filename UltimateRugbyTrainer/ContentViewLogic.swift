//
//  ContentViewManager.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/9/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct PixelTextForButton: View{
    var label: String
    var backgroundColor: Color = Color(UIColor(red: 60/255, green: 60/255, blue: 108/255, alpha: 1))
    var outlineColor: Color = Color(UIColor(red: 116/255, green: 112/255, blue: 148/255, alpha: 1))
    var textColor: Color = .white
    

    
    var body: some View{
        Text(label)
            .font(.custom("NFPixels-Regular", size: 30))
            .padding()
            .background(backgroundColor) // USA D4 Color
            .foregroundColor(textColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(outlineColor, lineWidth: 5) // USA D3 Color
            )
        
        
    }
}
