//
//  TurnView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct TurnView: View {
    @Bindable var game: Game
    @State var currentGuess: Guess = Guess(userGuess: false)
    var allSelectionsMade: Bool {
        ((currentGuess.userGuess == true) || (currentGuess.guesser != nil)) && (currentGuess.character != nil) && (currentGuess.weapon != nil) && (currentGuess.room != nil) && ((allPassed(set: currentGuess.passers, array: game.players, exclusion: currentGuess.guesser!)) || (currentGuess.disprover != nil)) && (currentGuess.guesser != currentGuess.disprover) && (!currentGuess.passers.contains(currentGuess.guesser!)) && (!currentGuess.passers.contains(currentGuess.disprover!))
        }
    
    
    var body: some View {
        ZStack{
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
            .padding()
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

    TurnView(game: game, currentGuess: Guess(userGuess: false))
}
