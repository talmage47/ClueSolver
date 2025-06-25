//
//  AddRoomsView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/24/25.
//

import SwiftUI

struct AddRoomsView: View {
    var game: Game
    @State private var newRoomName = ""
    @FocusState private var isFocused: Bool
        
    var body: some View {
        ZStack {
            
            VStack {
                FlowLayout {
                    ForEach(game.rooms) { room in
                        Text(room.roomName)
                            .padding()
                            .cornerRadius(10)
                            .onLongPressGesture {
                                if let index = game.rooms.firstIndex(of: room) {
                                    game.rooms.remove(at: index)
                                }
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                    generator.impactOccurred()
                                    
                            }
                    }
                }
                Spacer()
                TextField("Room Name", text: $newRoomName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocorrectionDisabled(true)
                    .focused($isFocused)
                    .onSubmit{
                        addNewRoom()
                        newRoomName = ""
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
    private func addNewRoom() {
           guard !newRoomName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        game.cardManager.addRoom(roomName: newRoomName.trimmingCharacters(in: .whitespaces))
       }
}

#Preview {
    AddRoomsView(game: Game())
}
