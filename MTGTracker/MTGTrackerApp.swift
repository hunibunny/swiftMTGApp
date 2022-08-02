//
//  MTGTrackerApp.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI

@main
struct MTGTrackerApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
