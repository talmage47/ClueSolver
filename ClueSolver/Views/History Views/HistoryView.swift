//
//  HistoryView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct HistoryView: View {
    @State private var selectedGuess: Guess? = nil
    @Bindable var game: Game

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(game.guessRecord, id: \.self) { guess in
                            SingleGuessScrollView(guess: guess)
                                .onTapGesture {
                                    selectedGuess = guess
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .sheet(item: $selectedGuess) { guess in
                    TurnView(game: game, currentGuess: guess)
                        .presentationDetents([.medium, .large])
                        .padding(.vertical)
                }
            }
        }
    }
}

#Preview {

    // Create a mock game
    let game = Game.mockGame()

    return HistoryView(game: game)
}
