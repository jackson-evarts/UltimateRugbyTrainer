//
//  FBTransitionView.swift
//  UltimateRugbyTrainer
//
//  Created by Joseph Townsend on 12/4/24.
//

import SwiftUI

struct FBTransitionView: View {
    @State private var navigateToNext = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image("Football")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                    .transition(.opacity) // Optional transition effect
                
                // Navigate to next view automatically after delay
                    .navigationDestination(isPresented: $navigateToNext) {
                    FootballView()
                }
            }
            .onAppear {
                // Delay before showing the next page
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Adjust seconds as needed
                    navigateToNext = true
                }
            }
        }
    }
    
}

#Preview {
    FBTransitionView()
}


