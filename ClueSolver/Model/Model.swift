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
    
//    var savedGames: Set<Game> = []
    var savedTemplates: Set<Template> = []
    var currentGame: Game?
    
    func startNewGame(newGame: Game) {
//        savedGames.insert(newGame)
        currentGame = newGame
    }
    
    func loadTemplate(_ template: Template){
        var newGame = Game()
        // Load characters
        if let characters = template.characters {
            newGame.characters = characters.map { GameCharacter(characterName: $0.name) }
        }
        // Load weapons
        if let weapons = template.weapons {
            newGame.weapons = weapons.map { Weapon(weaponName: $0.name) }
        }
        // Load rooms
        if let rooms = template.rooms {
            newGame.rooms = rooms.map { Room(roomName: $0.name) }
        }
        // Players are not in the template, so leave as is (empty)
        // Start the new game (adds to savedGames and sets currentGame)
        startNewGame(newGame: newGame)
    }
    
}
