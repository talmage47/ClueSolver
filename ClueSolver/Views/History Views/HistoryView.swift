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
                    ZStack {
                        Color("SheetBackground").ignoresSafeArea()
                        VStack {
                            RoundedRectangle(cornerRadius: 3)
                                    .fill(Color("UnselectedButton"))
                                    .frame(width: 40, height: 6)
                                    .padding(.top, 8)
                            GuessView(game: game, currentGuess: guess)
                        }
                    }
                    .ignoresSafeArea(.container, edges: .bottom)
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
