////
////  Player.swift
////  ClueSolver
////
////  Created by Talmage Gaisford on 6/11/25.
////
//
//import Foundation
//import SwiftUI
//
//
//protocol SelectableObject: Identifiable, Equatable, Hashable {
//    var displayName: String { get }
//}
//
//@Observable
//class Player: Identifiable, Equatable, Hashable, SelectableObject {
//    let id = UUID()
//    var playerName: String
//
//    var displayName: String { playerName }
//
//    init(playerName: String) {
//        self.playerName = playerName
//    }
//
//    static func == (lhs: Player, rhs: Player) -> Bool {
//        lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}
