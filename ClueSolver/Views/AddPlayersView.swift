//
//  AddPlayersView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/17/25.
//

import SwiftUI

struct AddPlayersView: View {
    var game: Game
    @State private var newPlayerName: String = ""
    @State private var isAddingPlayer = false
    @FocusState private var fieldFocused: Bool
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ZStack {
            Image("mansion2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(game.players) { player in
                        Text(player.playerName)
                            .font(.default)
                            .padding()
                            .glassEffect()
                    }
                }

                if isAddingPlayer {
                    TextField("", text: $newPlayerName, prompt: Text("New player"))
                        .textFieldStyle(.plain)            // remove native border
                    .font(.default)
                    .padding(8)
                    .glassEffect()                      // same look as names
                    .frame(minWidth: 100)               // satisfy grid width
                    .focused($fieldFocused)             // focus state
                    .submitLabel(.done)                 // nicer return key
                    .onAppear {                         // ← focus AFTER it exists
                        newPlayerName = ""
                        fieldFocused = true
                    }
                    .onSubmit(addPlayer)
                }
            }

            Button(action: {
                isAddingPlayer = true
            }) {
                Image(systemName: "person.fill.badge.plus")
                    .font(.title2)
                    .padding()
                    .glassEffect()
                }
            }
            
        
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline) // or .large
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Add Players")
                    .font(.custom("Papyrus", size: 28)) // or use .title, .headline, etc.
                    .foregroundColor(.white)
            }
        }
        #endif
    }
    
    private func addPlayer() {
           guard !newPlayerName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
           game.addPlayer(newPlayerName: newPlayerName.trimmingCharacters(in: .whitespaces))
           isAddingPlayer = false
           fieldFocused   = false           // dismiss keyboard
       }
    
}



#Preview {
    AddPlayersView(game: Game())
}
