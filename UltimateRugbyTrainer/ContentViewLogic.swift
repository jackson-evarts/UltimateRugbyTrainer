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
    
    var body: some View{
        Button(action: action){
            Text(label)
                .font(.custom("NFPixels-Regular", size: 30))
            
        }
        
    }
}
