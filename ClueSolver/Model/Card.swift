//
//  Card.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

@Observable
class Card: Identifiable, Equatable {
    let id = UUID()
    
    var unknownPlayers = Array<Player>()
    var noPlayers = Array<Player>()
    var yesPlayers = Array<Player>()
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
}

class Character: Card{
    var characterName: String
    
    init(characterName: String) {
        self.characterName = characterName
        super.init()
    }
}

class Weapon: Card{
    var weaponName: String
    
    init(weaponName: String) {
        self.weaponName = weaponName
        super.init()
    }
    
}

class Room: Card{
    var roomName: String
    
    init(roomName: String) {
        self.roomName = roomName
        super.init()
    }
    
}
