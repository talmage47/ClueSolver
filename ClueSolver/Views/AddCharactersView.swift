//
//  AddCharactersView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/24/25.
//

import SwiftUI

struct AddCharactersView: View {
    var game: Game
    @State private var newCharacterName = ""
    @FocusState private var isFocused: Bool
        
    var body: some View {
        ZStack {
            
            VStack {
                FlowLayout {
                    ForEach(game.characters) { character in
                        Text(character.characterName)
                            .padding()
                            .cornerRadius(10)
                            .onLongPressGesture {
                                if let index = game.characters.firstIndex(of: character) {
                                    game.characters.remove(at: index)
                                }
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                    generator.impactOccurred()
                                    
                            }
                    }
                }
                Spacer()
                TextField("Character Name", text: $newCharacterName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocorrectionDisabled(true)
                    .focused($isFocused)
                    .onSubmit{
                        addNewCharacter()
                        newCharacterName = ""
                        isFocused = true
                    }
                Spacer()
            }
            .onAppear {
                isFocused = true
            }
        }
        .navigationTitle(Text("Add Players"))
    }
    private func addNewCharacter() {
           guard !newCharacterName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        game.cardManager.addCharacter(characterName: newCharacterName.trimmingCharacters(in: .whitespaces))
       }
}

#Preview {
    AddCharactersView(game: Game())
}
