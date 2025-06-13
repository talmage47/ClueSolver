//
//  ContentView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination: NewGameView()) {
                    Text("Start New Game")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle(Text("Clue Solver"))
        }
    }
}

#Preview {
    ContentView()
}
