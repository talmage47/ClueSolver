//
//  Guess.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

@Observable
class Guess {
    
    var userGuess: Bool
    
    var guesser: Player?
    var character: GameCharacter?
    var weapon: Weapon?
    var room: Room?
    var passers: Set<Player>
    var disprover: Player?
    
    var isDisproved: Bool {
        disprover != nil
    }
    
    init(userGuess: Bool) {
        self.userGuess = userGuess
        self.passers = []
    }
}

//    init(guesser: Player, character: GameCharacter, weapon: Weapon, room: Room, passers: [Player], disprover: Player?) {
//        self.guesser = guesser
//        self.character = character
//        self.weapon = weapon
//        self.room = room
//        self.passers = passers
//        self.disprover = disprover
//    }
    

