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
        ZStack {
            VStack {
                
                VStack(alignment: .leading, spacing: 8) {
                    Toggle("User Guess is \(guess.userGuess ? "ON" : "OFF")", isOn: $guess.userGuess)
                        .tint(Color.blue)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                if !guess.userGuess {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Select Guesser")
                        SingleSelectionView(selectableItems: game.players, selectedItem: $guess.guesser)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color("Foreground"))
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Character")
                    SingleSelectionView(selectableItems: game.characters, selectedItem: $guess.character)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Weapon")
                    SingleSelectionView(selectableItems: game.weapons, selectedItem: $guess.weapon)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Room")
                    SingleSelectionView(selectableItems: game.rooms, selectedItem: $guess.room)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Passers")
                    MultipleSelectionView(selectableItems: game.players, selectedItems: $guess.passers)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Disprover")
                    SingleSelectionView(selectableItems: game.players, selectedItem: $guess.disprover)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
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

