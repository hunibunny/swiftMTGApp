//
//  MTGTrackerApp.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI

@main
struct MTGTrackerApp: App {
    @StateObject var modelData = ModelData()
   // @StateObject var observableInfo = ObservableInfo()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .onAppear{
                    save(modelDataToSave: modelData)
                }
        }
    }
}
