//
//  Game.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

@Observable
class Game {
    var players: [Player] = []
    var characters: [Character] = []
    var weapons: [Weapon] = []
    var rooms: [Room] = []
    
    var cardManager: CardManager!
    
    
    init() {
        self.cardManager = CardManager(game: self)
    }

}
