////
////  AddPlayersView.swift
////  ClueSolver
////
////  Created by Talmage Gaisford on 6/17/25.
////
//
//import SwiftUI
//
//struct AddPlayersView: View {
//    var game: Game
//    @State private var newPlayerName: String = ""
//    @State private var isAddingPlayer = false
//    @FocusState private var fieldFocused: Bool
//    
//    let columns = [GridItem(.adaptive(minimum: 100))]
//    
//    var body: some View {
//        ZStack {
////            Image("mansion2")
////                .resizable()
////                .scaledToFill()
////                .ignoresSafeArea()
//            
//            VStack {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(game.players) { player in
//                        Text(player.playerName)
//                            .padding()
//                    }
//                }
//                
//                Spacer()
//
//                TextField("new player", text: $newPlayerName)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                    .onSubmit{
//                            addPlayer()
//                    }
//                    .disabled(newPlayerName.isEmpty)
//                    .focused($fieldFocused)
//                
//                Spacer()
//                
//            }
//            .onAppear {
//                fieldFocused = true
//            }
//
////            Button(action: {
////                isAddingPlayer = true
////            }) {
////                Image(systemName: "person.fill.badge.plus")
////                    .font(.title2)
////                    .padding()
////                    .glassEffect()
////                }
//        }
//            
//        
//        #if os(iOS)
//        .navigationBarTitleDisplayMode(.inline) // or .large
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                Text("Add Players")
//                    .font(.custom("Papyrus", size: 28)) // or use .title, .headline, etc.
//                    .foregroundColor(.white)
//            }
//        }
//        #endif
//    }
//    
//    private func addPlayer() {
//           guard !newPlayerName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        game.playerManager.addPlayer(name: newPlayerName.trimmingCharacters(in: .whitespaces))
//           isAddingPlayer = false
//           fieldFocused   = false           // dismiss keyboard
//       }
//    
//}
//
//
//
//#Preview {
//    AddPlayersView(game: Game())
//}
