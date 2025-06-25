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
    
    var body: some View {
        VStack(spacing: 0) {
                    NewGameNavBar(selectedTab: $selectedTab)
                        .padding(.top, 50) // If you want space for status bar/safe area
                        .background(Color(.systemBackground))
                        .zIndex(1) // Keep it above the content
                    
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
                }
                .ignoresSafeArea(.keyboard) // Keeps layout from shifting when keyboard appears
            }
        }
#Preview {
    NewGameView(game: Game())
}
