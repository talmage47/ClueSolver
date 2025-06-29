//
//  CardSelectorView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/25/25.
//

import SwiftUI

struct CardSelectorView: View {
    var game: Game
    @State private var selectedTab: CardSelectorNavTab = .userCardsTab
    var allCardsSelected: Bool {
        !game.userCards.isEmpty
        }
    
    var body: some View {
        VStack(spacing: 0) {
            CardSelectorNavBar(selectedTab: $selectedTab)
                .background(Color(.systemBackground))
                .zIndex(1)
    
            NavigationLink(destination: CardSelectorView(game: game)) {
                Text("Continue")
                    .padding()
                    .background(allCardsSelected ? Color.blue : Color.gray)                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!allCardsSelected)
            .padding()
            
            Divider()
            
            Group {
                switch selectedTab {
                    case .userCardsTab:
                        SelectUserCards(game: game)
                    case .communityCardsTab:
                        SelectCommunityCards(game: game)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
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
    return CardSelectorView(game: game)
}
