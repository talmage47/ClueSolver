//
//  Player.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation
import SwiftUI

@Observable
class Player: Identifiable, Equatable {
    let id = UUID()
    var playerName: String

    init(playerName: String) {
        self.playerName = playerName
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
