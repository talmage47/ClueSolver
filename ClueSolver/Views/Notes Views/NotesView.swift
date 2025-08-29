//
//  GuessView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

enum Selectable: Identifiable, Equatable {
    case player(Player)
    case card(Card)
    
    var id: UUID {
        switch self {
        case .player(let player): return player.id
        case .card(let card):     return card.id
        }
    }
    
    var displayName: String {
        switch self {
        case .player(let player): return player.displayName
        case .card(let card):     return card.displayName
        }
    }
    
    static func == (lhs: Selectable, rhs: Selectable) -> Bool {
        switch (lhs, rhs) {
        case (.player(let l), .player(let r)): return l == r
        case (.card(let l), .card(let r)):     return l == r
        default: return false
        }
    }
}

struct NotesView: View {
    @Bindable var game: Game
    @State private var selectedObject: Selectable? = nil
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Players")
                    FlowLayout {
                        ForEach(game.players, id: \.id) { item in
                            Text(item.displayName)
                                .padding(10)
                                .background(Color.gray.opacity(0.3))
                                .foregroundColor(.black)
                                .cornerRadius(8)
                                .onTapGesture {
                                    selectedObject = .player(item)
                                }
                        }
                    }
                    .sheet(item: $selectedObject) { object in
                        ZStack {
                            Color("Background").ignoresSafeArea()
                            switch object {
                            case .player(let player):
                                PlayerNotesView()
                            case .card(let card):
                                Text("Card: \(card.displayName)")
                            }
                        }
                        .presentationDetents([.medium, .large])
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Foreground"))
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
                
            }
        }
    }
}

#Preview {
    NotesView(game: Game())
}
