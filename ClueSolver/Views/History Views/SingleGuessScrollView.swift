//
//  SingleGuessScrollView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/10/25.
//

import SwiftUI

struct SingleGuessScrollView: View {
    var guess: Guess
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Text("Guesser:")
                    Text(guess.guesser!.playerName)
                }
                HStack {
                    Text("Cards:")
                    Text(guess.character!.characterName + ", " + guess.weapon!.weaponName + ", " + guess.room!.roomName)
                }
                if guess.disprover != nil {
                    HStack {
                        Text("Disprover:")
                        Text(guess.guesser!.playerName)
                    }
                }
            }
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    )
            )
        }
    }
}

#Preview {
    let guess = Guess(userGuess: true)
        
        // Mock objects
        let mockPlayer = Player(playerName: "Alice")
        let mockCharacter = GameCharacter(characterName: "Miss Scarlet")
        let mockWeapon = Weapon(weaponName: "Candlestick")
        let mockRoom = Room(roomName: "Library")

        guess.guesser = mockPlayer
        guess.character = mockCharacter
        guess.weapon = mockWeapon
        guess.room = mockRoom
        guess.passers = [Player(playerName: "Bob"), Player(playerName: "Carol")]
        guess.disprover = Player(playerName: "Dave")

        return SingleGuessScrollView(guess: guess)
    }
