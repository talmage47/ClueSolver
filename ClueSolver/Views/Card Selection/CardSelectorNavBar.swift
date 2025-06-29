//
//  CardSelectorNavBar.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/28/25.
//

import SwiftUI

enum CardSelectorNavTab {
    case userCardsTab, communityCardsTab
}

struct CardSelectorNavBar: View {
    @Binding var selectedTab: CardSelectorNavTab
       
       var body: some View {
           HStack {
               Spacer()
               tabItem(tab: .userCardsTab, systemImage: "rectangle.stack.fill")
               Spacer()
               tabItem(tab: .communityCardsTab, systemImage: "eye.fill")
               Spacer()
           }
           .padding(.horizontal)
       }
       
       func tabItem(tab: CardSelectorNavTab, systemImage: String) -> some View {
           Button(action: {
               selectedTab = tab
           }) {
               Image(systemName: systemImage)
                   .font(.system(size: 24))
                   .foregroundColor(selectedTab == tab ? .blue : .gray)
                   .padding()
           }
       }
}

#Preview {
    CardSelectorNavBar(selectedTab: .constant(.userCardsTab))
}
