//
//  ContentView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import FoundationModels
import SwiftUI

struct ContentView: View {
    private var game: Game = Game()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("mansion1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Clue Solver")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .glassEffect()
                        .ignoresSafeArea(edges: .horizontal)
                    
                    Spacer()
                    Spacer()
                    
                    
                    NavigationLink(destination: AddPlayersView(game: game)) {
                        Text("Start New Game")
                            .font(.title2)
                            .padding()
                            .glassEffect()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: NewGameView()) {
                        Text("Resume Game")
                            .font(.title2)
                            .padding()
                            .glassEffect()
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
