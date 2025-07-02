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
        
    var body: some View {
        ZStack {
            
            VStack {
                FlowLayout {
                    ForEach(game.players) { player in
                        Text(player.playerName)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 2))
                            )
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
                    .focused($isFocused)
                    .onSubmit{
                        addNewPlayer()
                        newPlayerName = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                isFocused = true
                            }
                    }
            }
            .onAppear {
                isFocused = true
            }
        }
        .navigationTitle(Text("Add Players"))
    }
    private func addNewPlayer() {
           guard !newPlayerName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        game.cardManager.addPlayer(playerName: newPlayerName.trimmingCharacters(in: .whitespaces))
       }
}

#Preview {
    AddPlayersStripped(game: Game())
}
