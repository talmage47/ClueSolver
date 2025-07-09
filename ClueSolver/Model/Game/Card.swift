//
//  Card.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

@Observable
class Card: Identifiable, Equatable, Hashable, SelectableObject {
    let id = UUID()
    var cardName: String

    init(cardName: String) {
        self.cardName = cardName
    }

    var displayName: String { cardName }

    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class GameCharacter: Card {
    var characterName: String

    init(characterName: String) {
        self.characterName = characterName
        super.init(cardName: characterName)
    }
}

class Weapon: Card {
    var weaponName: String

    init(weaponName: String) {
        self.weaponName = weaponName
        super.init(cardName: weaponName)
    }
}

class Room: Card {
    var roomName: String

    init(roomName: String) {
        self.roomName = roomName
        super.init(cardName: roomName)
    }
}
