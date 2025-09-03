//
//  Player.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/2/25.
//

import Foundation
import SwiftUI



class Player: GameObject{
    var playerName: String

    init(playerName: String) {
        self.playerName = playerName
        super.init()
        self.gameObjectName = playerName
    }
}

//extension Player: SelectableGameObject {
//    var displayName: String { playerName }
//}

