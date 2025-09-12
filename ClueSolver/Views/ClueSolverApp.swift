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
    // Set up persistent container
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ClueSolverModel") // Use your .xcdatamodeld name
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()

    init() {
        Model.shared.context = persistentContainer.viewContext
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject the managed object context
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
