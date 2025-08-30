//
//  MultipleSelectionView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/9/25.
//

import SwiftUI

struct MultipleSelectionView<SpecificSelectableObject: SelectableObject>: View {
    var selectableItems: [SpecificSelectableObject]
    @Binding var selectedItems: Set<SpecificSelectableObject>

    var body: some View {
        FlowLayout {
            ForEach(selectableItems) { item in
                let isSelected = selectedItems.contains(item)
                
                Text(item.displayName)
                    .padding(10)
                    .background(isSelected ? Color.blue : Color("UnselectedButton"))
                    .foregroundColor(isSelected ? .white : .black)
                    .cornerRadius(8)
                    .onTapGesture {
                        if isSelected {
                            selectedItems.remove(item)
                        } else {
                            selectedItems.insert(item)
                        }
                    }
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedPlayers: Set<Player> = []

        var players: [Player] {
            [
                Player(playerName: "Alice"),
                Player(playerName: "Bob"),
                Player(playerName: "Charlie")
            ]
        }

        var body: some View {
            MultipleSelectionView(selectableItems: players, selectedItems: $selectedPlayers)
                .padding()
        }
    }

    return PreviewWrapper()
}
