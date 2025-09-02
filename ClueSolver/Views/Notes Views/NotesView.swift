//
//  GuessView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct NotesView: View {
    @Bindable var game: Game
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                NotesSelectionView(game: game)
    
            }
        }
    }
}

#Preview {
    NotesView(game: Game())
}
