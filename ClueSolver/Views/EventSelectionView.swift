//
//  EventSelectionView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/9/25.
//

import SwiftUI

struct EventSelectionView: View {
    @Bindable var game: Game
    @Bindable var guess: Guess
    
    var body: some View {
        VStack{
            
            Toggle("User Guess is \(guess.userGuess ? "ON" : "OFF")", isOn: $guess.userGuess)
                .padding(.horizontal, 80)
            
            if !guess.userGuess {
                Text("Select Guesser")
                SingleSelectionView(selectableItems: game.players, selectedItem: $guess.guesser)
            }
            
            Text("Select Character")
            SingleSelectionView(selectableItems: game.characters, selectedItem: $guess.character)
            
            Text("Select Weapon")
            SingleSelectionView(selectableItems: game.weapons, selectedItem: $guess.weapon)
            
            Text("Select Room")
            SingleSelectionView(selectableItems: game.rooms, selectedItem: $guess.room)
            
            Text("Select Passers")
            MultipleSelectionView(selectableItems: game.players, selectedItems: $guess.passers)
            
            Text("Select Disprover")
            SingleSelectionView(selectableItems: game.players, selectedItem: $guess.disprover)
        }
    }
}

#Preview {
    let game: Game = {
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
        return game
    }()
    
    EventSelectionView(game: game, guess: Guess(userGuess: false))
}
