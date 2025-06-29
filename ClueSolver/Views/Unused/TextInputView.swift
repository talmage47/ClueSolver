//
//  TextInputView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/20/25.
//

import SwiftUI

struct TextInputView: View {
    @State private var messageText = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .bottom, spacing: 8) {
                TextEditor(text: $messageText)
                    .padding(8)
                    .background(Color(.gray))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(minHeight: 40, maxHeight: 120)
                    .focused($isFocused)
                
                Button(action: {
                    sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding(.bottom, 8)
                }
                .disabled(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding()
            .background(.ultraThinMaterial)
            .onAppear {
                isFocused = true
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom) // Keeps it above the keyboard
    }

    func sendMessage() {
        // Handle message sending
        print("Sent: \(messageText)")
        messageText = ""
    }
}

#Preview {
    TextInputView()
}
