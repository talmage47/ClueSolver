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
    var characters: [GameCharacter] = []
    var weapons: [Weapon] = []
    var rooms: [Room] = []
    
    var userCards: Set<Card> = []
    var communityCards: Set<Card> = []
    
    var cardManager: CardManager!
    var deductionEngine: DeductionEngine!
    
    
    init() {
        self.cardManager = CardManager(game: self)
        self.deductionEngine = DeductionEngine(game: self)
    }

}
