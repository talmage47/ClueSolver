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

    func addPlayer(newPlayerName: String) {
        guard !newPlayerName.isEmpty else { return }
        players.append(Player(name: newPlayerName))
    }

    func removePlayer(id: UUID) {
        players.removeAll { $0.id == id }
    }
}
