//
//  PlayerNotesView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 8/29/25.
//

import SwiftUI

struct PlayerNotesView: View {
    @Environment(\.dismiss) private var dismiss
    var player: Player
    
    var body: some View {
        ScrollView{

            NotesDisplayView(title: "Yes Cards", selectableItems: player.yesCards)
            Divider()

            ForEach(player.maybeCardSets.indices, id: \.self) { index in
                NotesDisplayView(title: "Maybe Cards", selectableItems: player.maybeCardSets[index])
                Divider()
            }

            NotesDisplayView(title: "No Cards", selectableItems: player.noCards)
            Divider()

            NotesDisplayView(title: "Unknown Cards", selectableItems: player.unknownCards)
        }
    }
}

#Preview {
    PlayerNotesView(player: Game.mockGame().players[0])
}
