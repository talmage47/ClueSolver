////
////  Card.swift
////  ClueSolver
////
////  Created by Talmage Gaisford on 6/11/25.
////
//
//import Foundation
//
//@Observable
//class Card: GameObject{
//    
//    var unknownPlayers = Array<Player>()
//    var noPlayers = Array<Player>()
//    var yesPlayers = Array<Player>()
//    var isPossibleSolution: Bool = true
//    
//    var cardName: String?
//    
//}
//
//class GameCharacter: Card{
//    var characterName: String
//    
//    init(characterName: String) {
//        self.characterName = characterName
//        super.init()
//        self.cardName = characterName
//        self.gameObjectName = characterName
//    }
//}
//
//extension GameCharacter: SelectableGameObject {
//    var displayName: String { characterName }
//}
//
//class Weapon: Card{
//    var weaponName: String
//    
//    init(weaponName: String) {
//        self.weaponName = weaponName
//        super.init()
//        self.cardName = weaponName
//    }
//    
//}
//
//extension Weapon: SelectableGameObject {
//    var displayName: String { weaponName }
//}
//
//class Room: Card{
//    var roomName: String
//    
//    init(roomName: String) {
//        self.roomName = roomName
//        super.init()
//        self.cardName = roomName
//    }
//}
//
//extension Room: SelectableGameObject {
//    var displayName: String { roomName }
//}
