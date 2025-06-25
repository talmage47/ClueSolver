//
//  PlayerManager.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/23/25.
//

import Foundation
import SwiftUI

class CardManager: ObservableObject {
    
    private var colorPool: [Color] = [.red, .green, .blue, .orange, .purple, .yellow].shuffled()
    var game: Game
    
    init(game: Game){
        self.game = game
    }

    func addPlayer(playerName: String) {
        if colorPool.isEmpty {
            colorPool = [.red, .green, .blue, .orange, .purple, .yellow].shuffled()
        }

        let color = colorPool.removeFirst()
        let player = Player(playerName: playerName, color: color)
        game.players.append(player)
    }
    
    func removePlayer(id: UUID) {
        game.players.removeAll { $0.id == id }
    }
    
    func addCharacter(characterName: String) {
        let character = Character(characterName: characterName)
        game.characters.append(character)
    }
    
    func addWeapon(weaponName: String) {
        let weapon = Weapon(weaponName: weaponName)
        game.weapons.append(weapon)
    }
    
    func addRoom(roomName: String) {
        let room = Room(roomName: roomName)
        game.rooms.append(room)
    }
    
}
