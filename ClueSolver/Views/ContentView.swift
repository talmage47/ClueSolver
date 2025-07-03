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

            TurnTabView(model: model)
                .tabItem {
                    Label("Turn", systemImage: "person.crop.badge.magnifyingglass.fill")
                }

            GuessTabView(model: model)
                .tabItem {
                    Label("Guess", systemImage: "magnifyingglass")
                }
            
            HistoryTabView(model: model)
                .tabItem {
                    Label("History", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
