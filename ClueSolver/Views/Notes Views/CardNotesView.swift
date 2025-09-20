//
//  PlayerNotesView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 8/29/25.
//

import SwiftUI

struct CardNotesView: View {
    @Environment(\.dismiss) private var dismiss
    var card: Card
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Yes Player")
                    .foregroundStyle(Color("MainText"))
                if let player = card.yesPlayer {
                    Text("\(player.playerName)")
                        .foregroundStyle(Color("MainText"))
                        .backgroundStyle(Color("UnselectedButton"))
                }
                else {
                    Text("unknown")
                        .foregroundStyle(Color("MainText"))
                        .padding(10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color("Foreground"))
            )
            
            Divider()

            NotesDisplayView(title: "Maybe Players", selectableItems: card.maybePlayers)
            Divider()

            NotesDisplayView(title: "No Players", selectableItems: card.noPlayers)
            Divider()

            NotesDisplayView(title: "Unknown Players", selectableItems: card.unknownPlayers)
        }
    }
}

//#Preview {
//    CardNotesView(card: Game.mockGame().weapons[0])
//}
