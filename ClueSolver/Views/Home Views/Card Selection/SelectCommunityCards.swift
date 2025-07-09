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
                MultipleSelectionView(selectableItems: game.characters, selectedItems: $game.communityCards)
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Weapons")
                    .font(.title2)
                MultipleSelectionView(selectableItems: game.weapons, selectedItems: $game.communityCards)
                
                Spacer()
                Divider()
                Spacer()
                
                Text("Rooms")
                    .font(.title2)
                MultipleSelectionView(selectableItems: game.rooms, selectedItems: $game.communityCards)
                
                Spacer()
            }
        }
        .navigationTitle(Text("Select Your Cards"))
    }
    
}

#Preview {
    SelectCommunityCards(game: Game())
}
