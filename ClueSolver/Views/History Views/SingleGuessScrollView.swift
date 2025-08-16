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
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    Text("Guesser:")
                        .frame(width: 80, alignment: .leading)
                    Text(guess.guesser!.playerName)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text("Cards:")
                        .frame(width: 80, alignment: .leading)
                    Text("\(guess.character!.characterName), \(guess.weapon!.weaponName), \(guess.room!.roomName)")
                        .multilineTextAlignment(.leading)
                }
                if guess.disprover != nil {
                    HStack {
                        Text("Disprover:")
                            .frame(width: 80, alignment: .leading)
                        Text(guess.disprover!.playerName)
                            .multilineTextAlignment(.leading)
                    }
                }
                else {
                    HStack {
                        Text("Disprover:")
                            .frame(width: 80, alignment: .leading)
                        Text("Not Disproved")
                    }
                }
            }
            .padding(15)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color("Foreground"))
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
