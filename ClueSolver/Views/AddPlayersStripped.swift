//
//  AddPlayersStripped.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/23/25.
//

import SwiftUI

struct AddPlayersStripped: View {
    var game: Game
    @State private var newPlayerName = ""
    @FocusState private var isFocused: Bool
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ZStack {
            
            VStack {
                FlowLayout {
                    ForEach(game.players) { player in
                        Text(player.playerName)
                            .padding()
                            .background(player.color)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onLongPressGesture {
                                if let index = game.players.firstIndex(of: player) {
                                    game.players.remove(at: index)
                                }
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                    generator.impactOccurred()
                                    
                            }
                    }
                }
                Spacer()
                TextField("Player Name", text: $newPlayerName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocorrectionDisabled(true)
                    .onSubmit{
                        addNewPlayer()
                        newPlayerName = ""
                    }
                    .focused($isFocused)
                Spacer()
            }
            .onAppear {
                isFocused = true
            }
        }
        .navigationTitle(Text("Add Players"))
    }
    private func addNewPlayer() {
           guard !newPlayerName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        game.playerManager.addPlayer(name: newPlayerName.trimmingCharacters(in: .whitespaces))
           isFocused = false
       }
}

#Preview {
    AddPlayersStripped(game: Game())
}
