//
//  NewGameNavBar.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/24/25.
//

import SwiftUI

enum NavTab {
    case playersTab, charactersTab, weaponsTab, roomsTab
}

struct NewGameNavBar: View {
    @Binding var selectedTab: NavTab
       
       var body: some View {
           HStack {
               tabItem(tab: .playersTab, systemImage: "person.fill")
               Spacer()
               tabItem(tab: .charactersTab, systemImage: "hat.widebrim.fill")
               Spacer()
               tabItem(tab: .weaponsTab, systemImage: "fork.knife")
               Spacer()
               tabItem(tab: .roomsTab, systemImage: "house.fill")
           }
           .padding(.horizontal)
       }
       
       func tabItem(tab: NavTab, systemImage: String) -> some View {
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
    NewGameNavBar(selectedTab: .constant(.playersTab))
}
