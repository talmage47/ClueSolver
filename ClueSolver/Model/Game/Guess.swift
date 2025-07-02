//
//  Guess.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

class Guess {
    var guesser: Player
    var character: GameCharacter
    var weapon: Weapon
    var room: Room
    var disprover: Player?
    
    var isDisproved: Bool {
        disprover != nil
    }
    
    init(guesser: Player, character: GameCharacter, weapon: Weapon, room: Room, disprover: Player?) {
        self.guesser = guesser
        self.character = character
        self.weapon = weapon
        self.room = room
        self.disprover = disprover
    }
    
}
