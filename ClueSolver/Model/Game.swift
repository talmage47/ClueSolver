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

    func addPlayer() {
        players.append(Player())
    }

    func removePlayer(id: UUID) {
        players.removeAll { $0.id == id }
    }
}
