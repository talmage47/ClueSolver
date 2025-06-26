//
//  NewGameView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/12/25.
//

import SwiftUI

struct NewGameView: View {
    var game: Game
    @State private var selectedTab: NavTab = .playersTab
    var allCardsAdded: Bool {
        !game.players.isEmpty && !game.characters.isEmpty && !game.weapons.isEmpty && !game.rooms.isEmpty
        }
    
    var body: some View {
        VStack(spacing: 0) {
            NewGameNavBar(selectedTab: $selectedTab)
                .padding(.top, 50)
                .background(Color(.systemBackground))
                .zIndex(1)
    
            NavigationLink(destination: CardSelectorView(game: game)) {
                Text("Continue")
                    .padding()
                    .background(allCardsAdded ? Color.blue : Color.gray)                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
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
    NewGameView(game: Game())
}
