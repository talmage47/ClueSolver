//
//  Player.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

@Observable
class Player: Identifiable, Equatable {
    let id = UUID()
    var playerName: String = ""

    init(name: String = "") {
        self.playerName = name
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
