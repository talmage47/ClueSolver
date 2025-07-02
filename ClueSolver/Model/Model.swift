//
//  Model.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import Foundation

@Observable
class Model {
    static let shared = Model()
    
    var savedGames: Set<Game> = []
    var currentGame: Game?
    
    func startNewGame(newGame: Game) {
        savedGames.insert(newGame)
        currentGame = newGame
    }
    
}

