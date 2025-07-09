//
//  TurnView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct TurnView: View {
    var game: Game
    @State var currentGuess: Guess = Guess()
    var allSelectionsMade: Bool {
        (currentGuess.guesser != nil) && (currentGuess.character != nil) && (currentGuess.weapon != nil) && (currentGuess.room != nil)
        }
    
    var body: some View {
        ZStack{
            VStack{
                Text("Select Guesser")
                SingleSelectionView(selectableItems: game.players, selectedItem: $currentGuess.guesser)
                
                Text("Select Character")
                SingleSelectionView(selectableItems: game.characters, selectedItem: $currentGuess.character)
                
                Text("Select Weapon")
                SingleSelectionView(selectableItems: game.weapons, selectedItem: $currentGuess.weapon)
                
                Text("Select Room")
                SingleSelectionView(selectableItems: game.rooms, selectedItem: $currentGuess.room)
                
                Text("Select Passers")
                MultipleSelectionView(selectableItems: game.players, selectedItems: $currentGuess.passers)
                
                Text("Select Disprover")
                SingleSelectionView(selectableItems: game.players, selectedItem: $currentGuess.disprover)
                
                Button("Confirm") {
                    game.guessRecord.append(currentGuess)
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
}

//    @ViewBuilder
//    func selectableObjectView<T: SelectableGameObject>(
//        for object: T,
//        selected: T?,
//        onSelect: @escaping (T) -> Void
//    ) -> some View {
//        let isSelected = selected == object
//
//        Text(object.displayName)
//            .padding(10)
//            .background(isSelected ? Color.blue : Color.gray.opacity(0.3))
//            .foregroundColor(isSelected ? .white : .black)
//            .cornerRadius(8)
//            .onTapGesture {
//                onSelect(object)
//            }
//    }
    
    


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

    TurnView(game: game, currentGuess: Guess())
}
