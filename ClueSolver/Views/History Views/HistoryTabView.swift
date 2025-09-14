//
//  HistoryTabView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/2/25.
//

import SwiftUI

struct HistoryTabView: View {
    @Bindable var model: Model

    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            if let game = model.currentGame {
                HistoryView(game: game)
            } else {
                NewGamePromptView()
            }
        }
    }
}

//#Preview {
//    let game = Game()
//    game.players = [
//        Player(playerName: "Talmage"),
//        Player(playerName: "Myla")
//    ]
//    game.characters = [
//        GameCharacter(characterName: "Miss Scarlet"),
//        GameCharacter(characterName: "Colonel Mustard")
//    ]
//    game.weapons = [
//        Weapon(weaponName: "Candlestick"),
//        Weapon(weaponName: "Dagger"),
//        Weapon(weaponName: "Revolver")
//    ]
//    game.rooms = [
//        Room(roomName: "Kitchen")
//    ]
//    
//    let model = Model()
//    model.currentGame = game
//    
//    return HistoryTabView(model: model)
//}
