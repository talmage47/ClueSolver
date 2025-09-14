//
//  ClueSolverApp.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import SwiftUI
import CoreData

@main
struct ClueSolverApp: App {


    init() {
        let _ = Model.shared
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject the managed object context
                .environment(\.managedObjectContext, Model.shared.context)
        }
    }
}
