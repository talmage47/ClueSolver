//
//  GuessView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct NotesView: View {
    @Bindable var game: Game
    @State private var selectedObject: (any SelectableObject)? = nil
    @State private var showSheet: Bool = false
    
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
                                    selectedObject = item
                                    showSheet = true
                                }
                        }
                    }
                    .sheet(isPresented: $showSheet) {
                        ZStack {
                            Color("Background").ignoresSafeArea()
                            PlayerNotesView()
                        }
//                        .presentationDetents([.medium, .large])
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
