//
//  ChuckNorrisJokesApp.swift
//  ChuckNorrisJokes
//
//  Created by Marcela Hernandez on 16/9/24.
//

import SwiftUI

@main
struct ChuckNorrisJokesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
