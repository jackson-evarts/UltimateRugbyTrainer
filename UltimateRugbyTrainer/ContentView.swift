//
//  ContentView.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("This will be the Ultimate Rugby Trainer app")
            Text("Right now it is just a big rectangle though.")
        }
        .padding()
        Rectangle()
    }
}

#Preview {
    ContentView()
}
