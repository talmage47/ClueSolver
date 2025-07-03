//
//  TurnView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct TurnView: View {
    var game: Game
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Text("Characters")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.characters) { character in
                        selectableCardView(for: character)
                    }
                }
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Weapons")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.weapons) { weapon in
                        selectableCardView(for: weapon)
                    }
                }
                Spacer()
                Divider()
                Spacer()
                
                Text("Rooms")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.rooms) { room in
                        selectableCardView(for: room)
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle(Text("Select Your Cards"))
    }
    
    @ViewBuilder
    func selectableCardView(for card: Card) -> some View {
        let isSelected = game.userCards.contains(card)

        Text(card.cardName ?? "No Name")
            .padding(10)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.3))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(8)
            .onTapGesture {
                toggleSelection(of: card)
            }
    }
    
    private func toggleSelection(of item: Card) {
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
