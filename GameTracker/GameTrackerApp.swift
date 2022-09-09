//
//  GameTrackerApp.swift
//  GameTracker
//
//  Created by Pirita on 09/09/2022.
//

import SwiftUI

@main
struct GameTrackerApp: App {
    @StateObject var modelData = ModelData()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(modelData)
        }
    }
}
