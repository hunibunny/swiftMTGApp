//
//  trackerApp.swift
//  tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

@main
struct GameTrackerApp: App {
    //UIColorValueTransformer.register()

    @StateObject var modelData = ModelData()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(modelData)
        }
    }
}

