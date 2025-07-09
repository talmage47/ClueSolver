//
//  SingleSelectionView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/9/25.
//

import SwiftUI

struct SingleSelectionView<specificSelectableObject: SelectableObject>: View {
    var selectableItems: [specificSelectableObject]
    @Binding var selectedItem: specificSelectableObject?
    
    var body: some View {
        VStack {
            FlowLayout {
                ForEach(selectableItems) { item in
                    Text(item.displayName)
                        .padding(10)
                        .background(selectedItem?.id == item.id ? Color.blue : Color.gray.opacity(0.3))
                        .foregroundColor(selectedItem?.id == item.id ? .white : .black)
                        .cornerRadius(8)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedPlayer: Player? = nil

        var players: [Player] {
            [
                Player(playerName: "Alice"),
                Player(playerName: "Bob"),
                Player(playerName: "Charlie")
            ]
        }

        var body: some View {
            SingleSelectionView(selectableItems: players, selectedItem: $selectedPlayer)
                .padding()
        }
    }

    return PreviewWrapper()
}
