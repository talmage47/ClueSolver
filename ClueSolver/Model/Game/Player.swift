//
//  Player.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation
import SwiftUI


@Observable
class GameObject: Identifiable, Equatable, Hashable {
    let id = UUID()
    var gameObjectName: String?

    static func == (lhs: GameObject, rhs: GameObject) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


class Player: GameObject{
    var playerName: String

    init(playerName: String) {
        self.playerName = playerName
        super.init()
        self.gameObjectName = playerName
    }
}
