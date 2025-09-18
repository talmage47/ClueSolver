//
//  SelectUserCards.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/28/25.
//

import SwiftUI

struct SelectUserCards: View {
    @Bindable var game: Game
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Text("Characters")
                    .font(.title2)
                MultipleSelectionView(selectableItems: game.characters, selectedItems: $game.userCards)
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Weapons")
                    .font(.title2)
                MultipleSelectionView(selectableItems: game.weapons, selectedItems: $game.userCards)
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Rooms")
                    .font(.title2)
                MultipleSelectionView(selectableItems: game.rooms, selectedItems: $game.userCards)
                
                Spacer()
            }
        }
        .navigationTitle(Text("Select Your Cards"))
    }
    
}

#Preview {
    let game = Game()
    game.players = [
        Player(playerName: "Talmage"),
        Player(playerName: "Myla")
    ]
    game.characters = [
        GameCharacter(characterName: "Miss Scarlet"),
        GameCharacter(characterName: "Colonel Mustard")
    ]
    game.weapons = [
        Weapon(weaponName: "Candlestick"),
        Weapon(weaponName: "Dagger"),
        Weapon(weaponName: "Revolver")
    ]
    game.rooms = [
        Room(roomName: "Kitchen")
    ]
    return SelectUserCards(game: game)
}
