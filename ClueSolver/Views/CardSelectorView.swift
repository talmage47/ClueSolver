//
//  CardSelectorView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/25/25.
//

import SwiftUI

struct CardSelectorView: View {
    var game: Game
    @State private var selectedItems: Set<Card> = []
    
    var body: some View {
        ZStack{
            VStack{
                FlowLayout {
                    ForEach(game.characters) { character in
                        selectableCardView(for: character)
                    }
                }
            }
        }
        .navigationTitle(Text("Select Cards"))
    }
    
    @ViewBuilder
    func selectableCardView(for character: GameCharacter) -> some View {
        let isSelected = selectedItems.contains(character)

        Text(character.characterName)
            .padding(10)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.3))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(8)
            .onTapGesture {
                toggleSelection(of: character)
            }
    }
    
    private func toggleSelection(of item: Card) {
            if selectedItems.contains(item) {
                selectedItems.remove(item)
            } else {
                selectedItems.insert(item)
            }
        }
}

#Preview {
    CardSelectorView(game: Game())
}
