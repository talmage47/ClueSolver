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
    
    var body: some View {
        ZStack{
            VStack{
                Text("Select Guesser")
                FlowLayout {
                    ForEach(game.players) { player in
                        Text(player.playerName)
                            .padding(10)
                            .background(currentGuess.guesser?.id == player.id ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(currentGuess.guesser?.id == player.id ? .white : .black)
                            .cornerRadius(8)
                            .onTapGesture {
                                currentGuess.guesser = player
                            }
                    }
                }
                
                Text("Select Character")
                FlowLayout {
                    ForEach(game.characters) { character in
                        Text(character.characterName)
                            .padding(10)
                            .background(currentGuess.character?.id == character.id ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(currentGuess.character?.id == character.id ? .white : .black)
                            .cornerRadius(8)
                            .onTapGesture {
                                currentGuess.character = character
                            }
                    }
                }
                
                Text("Select Weapon")
                FlowLayout {
                    ForEach(game.weapons) { weapon in
                        Text(weapon.weaponName)
                            .padding(10)
                            .background(currentGuess.weapon?.id == weapon.id ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(currentGuess.weapon?.id == weapon.id ? .white : .black)
                            .cornerRadius(8)
                            .onTapGesture {
                                currentGuess.weapon = weapon
                            }
                    }
                }
                
                Text("Select Room")
                FlowLayout {
                    ForEach(game.rooms) { room in
                        Text(room.roomName)
                            .padding(10)
                            .background(currentGuess.room?.id == room.id ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(currentGuess.room?.id == room.id ? .white : .black)
                            .cornerRadius(8)
                            .onTapGesture {
                                currentGuess.room = room
                            }
                    }
                }
            }
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
