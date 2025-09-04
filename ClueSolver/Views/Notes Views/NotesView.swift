//
//  GuessView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct NotesView: View {
    @Bindable var game: Game
    @State private var selectedPlayer: Player? = nil
    @State private var selectedCard: Card? = nil
    
    var body: some View {
        ZStack {
            ScrollView{
                NotesSelectionView(selectableItems: game.players, selectedItem: $selectedPlayer)
                NotesSelectionView(selectableItems: game.characters, selectedItem: $selectedCard)
                NotesSelectionView(selectableItems: game.weapons, selectedItem: $selectedCard)
                NotesSelectionView(selectableItems: game.rooms, selectedItem: $selectedCard)

            }
            .sheet(isPresented: Binding<Bool>(get: { selectedPlayer != nil || selectedCard != nil }, set: { newValue in if !newValue { selectedPlayer = nil; selectedCard = nil } })) {
                ZStack {
                    Color("SheetBackground").ignoresSafeArea()
                    if let player = selectedPlayer {
                        VStack {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color("UnselectedButton"))
                                .frame(width: 40, height: 6)
                                .padding(.top, 8)
                            PlayerNotesView(player: player)
                        }
                    } else if let card = selectedCard {
                        VStack {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color("UnselectedButton"))
                                .frame(width: 40, height: 6)
                                .padding(.top, 8)
                            CardNotesView(card: card)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    NotesView(game: Game.mockGame())
}
