//
//  ContentView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import SwiftUI

enum Route: Hashable {
    case newGame(Game)
    case cardSelector(Game)
    case loadTemplate
    case loadSavedGame
}

struct HomeView: View {
    var model: Model
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            ZStack {
                Image("mansion1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack() {
                    
                    Text("Clue Solver")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .ignoresSafeArea(edges: .horizontal)
                    
                    Spacer()
                    
                    Button("Start New Game") {
                        navPath.append(Route.newGame(Game()))
                    }
                    .buttonStyle(HomeButtonStyle())
                    
                    Spacer()
                    
                    Button("Load Game Template") {
                        navPath.append(Route.loadTemplate(model))
                    }
                    .buttonStyle(HomeButtonStyle())
                    
                    Spacer()
                    
//                    Button("Load Saved Game") {
//                        navPath.append(Route.loadSavedGame)
//                    }
//                    .buttonStyle(HomeButtonStyle())
//                    
//                    Spacer()
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .newGame(let game):
                        NewGameView(game: game, navPath: $navPath)
                    case .cardSelector(let game):
                        CardSelectorView(game: game, navPath: $navPath, onComplete: { game in model.startNewGame(newGame: game)})
                    case .loadTemplate(let model):
                        LoadTemplateView(model: model, navPath: $navPath)
                    case .loadSavedGame:
                        LoadSavedGameView(navPath: $navPath)
                    }
                }
//                VStack {
//                    
//                    Text("Clue Solver")
//                        .font(.system(size: 48, weight: .bold))
//                        .foregroundColor(.black)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .ignoresSafeArea(edges: .horizontal)
//                    
//                    Spacer()
//                    Spacer()
//                    
//                    
//                    NavigationLink(destination: NewGameView(game: Game())) {
//                        Text("Start New Game")
//                            .font(.title2)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    
//                    Spacer()
//                    
//                    NavigationLink(destination: NewGameView(game: Game(), onComplete: { game in
//                        model.startNewGame(newGame: game)})) {
//                        Text("Resume Game")
//                            .font(.title2)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    
//                    Spacer()
//                }
                .padding()
            }
        }
        .navigationTitle(Text(""))
    }
}

struct HomeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .padding()
            .foregroundColor(.white)
            .padding(.horizontal)
            .glassEffect(in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    HomeView(model: Model())
}
