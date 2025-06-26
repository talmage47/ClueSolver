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
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 2))
                            )
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                isFocused = true
                            }
                    }
            }
            .onAppear {
                isFocused = true
            }
        }
        .navigationTitle(Text("Add Rooms"))
    }
    private func addNewRoom() {
           guard !newRoomName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        game.cardManager.addRoom(roomName: newRoomName.trimmingCharacters(in: .whitespaces))
       }
}

#Preview {
    AddRoomsView(game: Game())
}
