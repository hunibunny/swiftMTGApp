//
//  trackerApp.swift
//  tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

@main
struct trackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
