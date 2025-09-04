//
//  NotesSelectionView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/2/25.
//

import SwiftUI

struct NotesSelectionView<specificSelectableObject: SelectableObject>: View {
    var selectableItems: [specificSelectableObject]
    @Binding var selectedItem: specificSelectableObject?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Players")
                FlowLayout {
                    ForEach(selectableItems) { item in
                        Text(item.displayName)
                            .padding(10)
                            .background(Color("UnselectedButton"))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .onTapGesture {
                                selectedItem = item
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

//#Preview {
//    NotesSelectionView(game: Game.mockGame(), selectableObjectArray: Game.mockGame().players)
//}
