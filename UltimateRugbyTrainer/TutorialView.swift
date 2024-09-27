//
//  TutorialView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/22/24.
//

import SwiftUI

struct TutorialView: View {
    
    var body: some View {
        VStack {
            Text("Tutorial Page")
                .font(.largeTitle)
                .padding()
            
            Text("Learn more here.")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Tutorial")
    }
}

// TODO: chef up some graphics/photos for how to play the game. This can be done at the end of development

#Preview {
    TutorialView()
}
