//
//  ContentViewManager.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/9/24.
//

import Foundation
import SwiftUI


// TODO: Finish the custom button so that we don't repeat code for every button!
struct PixelButton: View{
    var label: String
    var backgroundColor: Color = .blue
    var action: () -> Void
    var textColor: Color = .white

    
    var body: some View{
        Button(action: action){
            Text(label)
                .font(.custom("NFPixels-Regular", size: 30))
                .padding()
                .background(Color(UIColor(red: 60/255, green: 60/255, blue: 108/255, alpha: 1))) // USA D4 Color
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(UIColor(red: 116/255, green: 112/255, blue: 148/255, alpha: 1))) // USA D3 Color
                )
        }
        
    }
}
