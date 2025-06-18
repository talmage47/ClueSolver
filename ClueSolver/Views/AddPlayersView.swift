//
//  AddPlayersView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/17/25.
//

import SwiftUI

struct AddPlayersView: View {
    var body: some View {
        ZStack {
            Image("mansion2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
//                Text("Add Players")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .glassEffect()
//                
//                Spacer()

                PlayerAvatar(playerName: "+")
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
}

#Preview {
    AddPlayersView()
}
