//
//  TurnView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct GuessView: View {
    @Bindable var game: Game
    @State var currentGuess: Guess = Guess(userGuess: false)
    var allSelectionsMade: Bool {
        guard
            currentGuess.character != nil,
            currentGuess.weapon != nil,
            currentGuess.room != nil
        else {
            return false
        }

        // Allow either userGuess OR a selected guesser
        guard currentGuess.userGuess || currentGuess.guesser != nil else {
            return false
        }

        // Unwrap guesser for the rest
        guard let guesser = currentGuess.guesser else {
            return false
        }

        // Guesser cannot be in passers
        if currentGuess.passers.contains(guesser) {
            return false
        }

        // List of players except the guesser
        let allPlayersButGuesser = game.players.filter { $0 != guesser }
        let allPassed = currentGuess.passers.isSuperset(of: allPlayersButGuesser)

        // If there's a disprover, make sure it's valid
        if let disprover = currentGuess.disprover {
            if disprover == guesser { return false }
            if currentGuess.passers.contains(disprover) { return false }
        } else if !allPassed {
            // If no disprover, require full pass
            return false
        }

        return true
    }
    
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            ScrollView{
                EventSelectionView(game: game, guess: currentGuess)
                
                Button("Confirm") {
                    game.guessRecord.append(currentGuess)
                    currentGuess = Guess(userGuess: false)
                }
                .padding()
                .background(allSelectionsMade ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .disabled(!allSelectionsMade)
                .padding()
            }
        }
        .navigationTitle(Text("Select Your Cards"))
    }
    
    func allPassed(set: Set<Player>, array: [Player], exclusion: Player) -> Bool {
        let filteredArray = array.filter { $0 != exclusion }
        return set.isSuperset(of: filteredArray)
    }
}

#Preview {
    let game: Game = {
        let game = Game()
        game.players = [
            Player(playerName: "Matthias"),
            Player(playerName: "Mylalala"),
            Player(playerName: "Emily"),
            Player(playerName: "Zachary"),
            Player(playerName: "Megan"),
        ]
        game.characters = [
            GameCharacter(characterName: "Miss Scarlet"),
            GameCharacter(characterName: "Colonel Mustard"),
            GameCharacter(characterName: "Miss Peacock"),
            GameCharacter(characterName: "Mister Green"),
            GameCharacter(characterName: "Mrs White"),
            GameCharacter(characterName: "Mister Plum")
        ]
        game.weapons = [
            Weapon(weaponName: "Candlestick"),
            Weapon(weaponName: "Dagger"),
            Weapon(weaponName: "Revolver"),
            Weapon(weaponName: "Rope"),
            Weapon(weaponName: "Pipe"),
            Weapon(weaponName: "Wrench")
        ]
        game.rooms = [
            Room(roomName: "Kitchen"),
            Room(roomName: "Bathroom"),
            Room(roomName: "Closet"),
            Room(roomName: "Ballroom"),
            Room(roomName: "Mancave"),
            Room(roomName: "Library"),
            Room(roomName: "Dining Room"),
            Room(roomName: "Bedroom"),
            Room(roomName: "Conservatory")
        ]
        return game
    }()

    GuessView(game: game, currentGuess: Guess(userGuess: false))
}
