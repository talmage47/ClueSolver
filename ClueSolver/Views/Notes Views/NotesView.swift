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
            VStack(alignment: .leading, spacing: 8) {
                Text("Players")
                FlowLayout {
                    ForEach(game.players, id: \.id) { item in
                        Text(item.displayName)
                            .padding(10)
                            .background(Color("UnselectedButton"))
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
                        Color("SheetBackground").ignoresSafeArea()
                        VStack {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color("UnselectedButton"))
                                .frame(width: 40, height: 6)
                                .padding(.top, 8)
                            PlayerNotesView()
                        }
                    }
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

#Preview {
    NotesView(game: Game())
}
