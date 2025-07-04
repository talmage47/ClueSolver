//
//  TurnView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct TurnView: View {
    var game: Game
    var currentGuess: Guess
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Text("Characters")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.characters) { character in
                        selectableObjectView(for: character)
                    }
                }
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Weapons")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.weapons) { weapon in
                        selectableObjectView(for: weapon)
                    }
                }
                Spacer()
                Divider()
                Spacer()
                
                Text("Rooms")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.rooms) { room in
                        selectableObjectView(for: room)
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle(Text("Select Your Cards"))
    }
    
    @ViewBuilder
    func selectableObjectView(for gameObject: GameObject) -> some View {
        let isSelected = game.userCards.contains(gameObject)

        Text(gameObject.cardName ?? "No Name")
            .padding(10)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.3))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(8)
            .onTapGesture {
                toggleSelection(of: gameObject)
            }
    }
    
    private func toggleSelection(of item: GameObject) {
        if game.userCards.contains(item) {
            game.userCards.remove(item)
        } else {
            game.userCards.insert(item)
        }
    }
}

#Preview {
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
    
    return TurnView(game: game)
}
