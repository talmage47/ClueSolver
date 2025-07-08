//
//  SelectCommunityCards.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/28/25.
//

import SwiftUI

struct SelectCommunityCards: View {
    @Bindable var game: Game
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Text("Characters")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.characters) { character in
                        selectableCardView(for: character)
                    }
                }
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Weapons")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.weapons) { weapon in
                        selectableCardView(for: weapon)
                    }
                }
                Spacer()
                Divider()
                Spacer()
                
                Text("Rooms")
                    .font(.title2)
                FlowLayout {
                    ForEach(game.rooms) { room in
                        selectableCardView(for: room)
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle(Text("Select Your Cards"))
    }
    
    @ViewBuilder
    func selectableCardView(for card: Card) -> some View {
        let isSelected = game.communityCards.contains(card)

        Text(card.cardName ?? "No Name")
            .padding(10)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.3))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(8)
            .onTapGesture {
                toggleSelection(of: card)
            }
    }
    
    private func toggleSelection(of item: Card) {
        if game.communityCards.contains(item) {
            game.communityCards.remove(item)
        } else {
            game.communityCards.insert(item)
        }
    }
}

#Preview {
    SelectCommunityCards(game: Game())
}
