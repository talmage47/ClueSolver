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
                VStack(spacing: 12) {
                    ForEach(game.guessRecord, id: \.self) { guess in
                        SingleGuessScrollView(guess: guess)
                            .onTapGesture {
                                selectedGuess = guess
                            }
                    }
                }
                .padding()
            }
            .sheet(item: $selectedGuess) { guess in
                TurnView(game: game, currentGuess: selectedGuess!)
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
    guess1.character = GameCharacter(characterName: "Miss Scarlet")
    guess1.weapon = Weapon(weaponName: "Revolver")
    guess1.room = Room(roomName: "Kitchen")
    guess1.passers = [bob]
    guess1.disprover = carol

    let guess2 = Guess(userGuess: false)
    guess2.guesser = bob
    guess2.character = GameCharacter(characterName: "Colonel Mustard")
    guess2.weapon = Weapon(weaponName: "Wrench")
    guess2.room = Room(roomName: "Library")
    guess2.passers = [alice]
    // no disprover

    game.guessRecord = [guess1, guess2]

    return HistoryView(game: game)
}
