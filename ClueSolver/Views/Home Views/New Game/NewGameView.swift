//
//  NewGameView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/12/25.
//

import SwiftUI
import CoreData

struct NewGameView: View {
    var game: Game
    @Binding var navPath: NavigationPath
    @State private var selectedTab: NewGameNavTab = .playersTab
    
    @Environment(\.managedObjectContext) private var context
    
    @State private var isShowingTemplateNameAlert = false
    @State private var templateName: String = ""
    @State private var templateSaveError: String? = nil
    
    var allCardsAdded: Bool {
        !game.players.isEmpty && !game.characters.isEmpty && !game.weapons.isEmpty && !game.rooms.isEmpty
        }
    
    var body: some View {
        VStack(spacing: 0) {
            NewGameNavBar(selectedTab: $selectedTab)
                .background(Color("Background"))
                .zIndex(1)
    
            HStack {
                Button("Save as Template") {
                    isShowingTemplateNameAlert = true
                }
                .padding()
                .background(allCardsAdded ? Color.green : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .disabled(!allCardsAdded)
                .padding()
                
                Button("Continue") {
                    navPath.append(Route.cardSelector(game))
                }
                .padding()
                .background(allCardsAdded ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .disabled(!allCardsAdded)
                .padding()
            }
            
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
            .alert("Save Template", isPresented: $isShowingTemplateNameAlert) {
                TextField("Template Name", text: $templateName)
                Button("Save", action: {
                    do {
                        try Model.shared.saveTemplate(from: game, named: templateName, context: context)
                        templateName = ""
                    } catch {
                        templateSaveError = error.localizedDescription
                    }
                })
                Button("Cancel", role: .cancel, action: { templateName = "" })
            } message: {
                if let error = templateSaveError {
                    Text("Error: \(error)")
                } else {
                    Text("Enter a name to save this template.")
                }
            }
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
