//
//  HistoryView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct HistoryView: View {
    @State private var selectedGuess: Guess? = nil
    @Bindable var game: Game

    var body: some View {
        VStack {
            Text("Guess History")
                .font(.headline)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(game.guessRecord, id: \.self) { guess in
                        SingleGuessScrollView(guess: guess)
                            .onTapGesture {
                                selectedGuess = guess
                            }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .sheet(item: $selectedGuess) { guess in
                TurnView(game: game, currentGuess: guess)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    // Create mock players
    let alice = Player(playerName: "Alice")
    let bob = Player(playerName: "Bob")
    let carol = Player(playerName: "Carol")

    // Create a mock game
    let game = Game()

    // Create mock guesses
    let guess1 = Guess(userGuess: true)
    guess1.guesser = alice
    guess1.character = GameCharacter(characterName: "Green")
    guess1.weapon = Weapon(weaponName: "Gun")
    guess1.room = Room(roomName: "Closet")
    guess1.passers = [bob]
    guess1.disprover = carol

    let guess2 = Guess(userGuess: false)
    guess2.guesser = bob
    guess2.character = GameCharacter(characterName: "Colonel Mustard")
    guess2.weapon = Weapon(weaponName: "Rope")
    guess2.room = Room(roomName: "Ballroom")
    guess2.passers = [alice]
    // no disprover
    
    let guess3 = Guess(userGuess: false)
    guess3.guesser = bob
    guess3.character = GameCharacter(characterName: "Miss Scarlet")
    guess3.weapon = Weapon(weaponName: "Knife")
    guess3.room = Room(roomName: "Ballroom")
    guess3.passers = [alice]
    guess3.disprover = carol

    game.guessRecord = [guess1, guess2, guess3]

    return HistoryView(game: game)
}
