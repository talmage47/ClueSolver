//
//  PlayerManager.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/23/25.
//

import Foundation
import SwiftUI

class PlayerManager: ObservableObject {
    
    private var colorPool: [Color] = [.red, .green, .blue, .orange, .purple, .pink].shuffled()
    var game: Game
    
    init(game: Game){
        self.game = game
    }

    func addPlayer(name: String) {
        if colorPool.isEmpty {
            colorPool = [.red, .green, .blue, .orange, .purple, .pink].shuffled()
        }

        let color = colorPool.removeFirst()
        let player = Player(name: name, color: color)
        game.players.append(player)
    }
    
    func removePlayer(id: UUID) {
        game.players.removeAll { $0.id == id }
    }
}
