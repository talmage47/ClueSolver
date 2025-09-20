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
                NotesSelectionView(title: "Players", selectableItems: game.players, selectedItem: $selectedPlayer)
                Divider()
                NotesSelectionView(title: "Characters", selectableItems: game.characters, selectedItem: $selectedCard)
                Divider()
                NotesSelectionView(title: "Weapons", selectableItems: game.weapons, selectedItem: $selectedCard)
                Divider()
                NotesSelectionView(title: "Rooms", selectableItems: game.rooms, selectedItem: $selectedCard)

            }
            .sheet(isPresented: Binding<Bool>(get: { selectedPlayer != nil || selectedCard != nil }, set: { newValue in if !newValue { selectedPlayer = nil; selectedCard = nil } })) {
                ZStack {
                    Color("SheetBackground").ignoresSafeArea()
                    VStack {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color("UnselectedButton"))
                            .frame(width: 40, height: 6)
                            .padding(.top, 8)
                        if let player = selectedPlayer {
                            Text(player.displayName)
                                .font(.title)
                                .foregroundStyle(Color("MainText"))
                                .padding()
                            PlayerNotesView(player: player)
                        }
                        else if let card = selectedCard {
                            Text(card.displayName)
                                .font(.title)
                                .foregroundStyle(Color("MainText"))
                                .padding()
                            CardNotesView(card: card)
                        }
                        else {
                            EmptyView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NotesView(game: Game.mockGame())
}
