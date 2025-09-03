//
//  MultipleSelectionView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/9/25.
//

import SwiftUI

struct MultipleSelectionView<T: GameObject>: View where T: Hashable {
    var selectableItems: [T]
    @Binding var selectedItems: Set<T>

    var body: some View {
        FlowLayout {
            ForEach(selectableItems, id: \.self) { item in
                let isSelected = selectedItems.contains(item)
                
                Text(item.gameObjectName ?? "blank" as String)
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

