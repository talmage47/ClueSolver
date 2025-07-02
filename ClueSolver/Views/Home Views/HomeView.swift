//
//  ContentView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("mansion1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Clue Solver")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .ignoresSafeArea(edges: .horizontal)
                    
                    Spacer()
                    Spacer()
                    
                    
                    NavigationLink(destination: NewGameView(game: Game())) {
                        Text("Start New Game")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: NewGameView(game: Game())) {
                        Text("Resume Game")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle(Text(""))
    }
}

#Preview {
    HomeView()
}
