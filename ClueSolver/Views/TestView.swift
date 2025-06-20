//
//  TestView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/17/25.
//

import SwiftUI

struct TestView: View {
    @State private var newPlayerName: String = ""
    @State private var isAddingPlayer = false
    @FocusState private var nameFieldIsFocused: Bool
    
    
    var body: some View {
        TextField("Enter player name", text: $newPlayerName, onCommit: {
            //nothing
        })
        .textFieldStyle(.roundedBorder)
        .focused($nameFieldIsFocused)
        .padding()
        .onAppear {
            newPlayerName = ""
        }
    }
}

#Preview {
    TestView()
}
