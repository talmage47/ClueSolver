//
//  NewGameView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/12/25.
//

import SwiftUI

struct NewGameView: View {
    var game: Game
    @Binding var navPath: NavigationPath
    
    @State private var selectedTab: NewGameNavTab = .playersTab
    var allCardsAdded: Bool {
        !game.players.isEmpty && !game.characters.isEmpty && !game.weapons.isEmpty && !game.rooms.isEmpty
        }
    
    var body: some View {
        VStack(spacing: 0) {
            NewGameNavBar(selectedTab: $selectedTab)
                .background(Color(.systemBackground))
                .zIndex(1)
    
            Button("Continue") {
                navPath.append(Route.cardSelector(game))
            }
            .padding()
            .background(allCardsAdded ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(!allCardsAdded)
            .padding()
            
            Divider()
            
            Group {
                switch selectedTab {
                    case .playersTab:
                        AddPlayersStripped(game: game)
                    case .charactersTab:
                        AddCharactersView(game: game)
                    case .weaponsTab:
                        AddWeaponsView(game: game)
                    case .roomsTab:
                        AddRoomsView(game: game)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State private var navPath = NavigationPath()

    var body: some View {
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

        return NewGameView(
            game: game,
            navPath: $navPath,
        )
    }
}
