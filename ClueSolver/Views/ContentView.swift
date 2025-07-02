//
//  ContentView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    private var model = Model.shared
    
    var body: some View {
        TabView {
            HomeView(model: model)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            TurnView()
                .tabItem {
                    Label("Turn", systemImage: "person.crop.badge.magnifyingglass.fill")
                }

            GuessView()
                .tabItem {
                    Label("Guess", systemImage: "magnifyingglass")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
