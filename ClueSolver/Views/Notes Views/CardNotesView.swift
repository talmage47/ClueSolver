//
//  PlayerNotesView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 8/29/25.
//

import SwiftUI

struct CardNotesView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var card: Card
    
    var body: some View {
        Text("Card notes view")
    }
}

#Preview {
    CardNotesView(card: Game.mockGame().weapons[0])
}
