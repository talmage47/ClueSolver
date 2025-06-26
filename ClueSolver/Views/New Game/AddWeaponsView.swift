//
//  AddWeaponsView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/24/25.
//

import SwiftUI

struct AddWeaponsView: View {
    var game: Game
    @State private var newWeaponName = ""
    @FocusState private var isFocused: Bool
        
    var body: some View {
        ZStack {
            
            VStack {
                FlowLayout {
                    ForEach(game.weapons) { weapon in
                        Text(weapon.weaponName)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 2))
                            )
                            .onLongPressGesture {
                                if let index = game.weapons.firstIndex(of: weapon) {
                                    game.weapons.remove(at: index)
                                }
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                    generator.impactOccurred()
                                    
                            }
                    }
                }
                Spacer()
                TextField("Weapon Name", text: $newWeaponName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocorrectionDisabled(true)
                    .focused($isFocused)
                    .onSubmit{
                        addNewWeapon()
                        newWeaponName = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                isFocused = true
                            }
                    }
            }
            .onAppear {
                isFocused = true
            }
        }
        .navigationTitle(Text("Add Weapons"))
    }
    private func addNewWeapon() {
           guard !newWeaponName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        game.cardManager.addWeapon(weaponName: newWeaponName.trimmingCharacters(in: .whitespaces))
       }
}

#Preview {
    AddWeaponsView(game: Game())
}
