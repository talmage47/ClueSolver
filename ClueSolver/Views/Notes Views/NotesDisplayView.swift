//
//  PlayerNotesSelectionView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/20/25.
//

import SwiftUI

struct NotesDisplayView<specificSelectableObject: SelectableObject>: View {
    var title: String?
    
    var selectableItems: [specificSelectableObject]
//    @Binding var selectedItem: specificSelectableObject?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                
                if let title {
                    Text(title)
                        .foregroundStyle(Color("MainText"))
                }
                
                if selectableItems.isEmpty {
                    Text("no items")
                        .foregroundColor(Color("MainText"))
                        .padding(10)
                } else {
                    FlowLayout {
                        ForEach(selectableItems) { item in
                            Text(item.displayName)
                                .padding(10)
                                .background(Color("UnselectedButton"))
                                .foregroundColor(.black)
                                .cornerRadius(8)
//                                .onTapGesture {
//                                    selectedItem = item
//                                }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color("Foreground"))
            )
        }
    }
}


//#Preview {
//    PlayerNotesSelectionView()
//}

