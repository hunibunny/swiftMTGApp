//
//  MTGTrackerApp.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI
import CoreData
import Foundation

/*
//create a class to use as your app's delegate
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    //...add any other NSApplicationDelegate methods you need to use
}
*/

@main
struct MTGTrackerApp: App {
    //@Environment(\.managedObjectContext) var moc
    @StateObject var modelData = ModelData()

   // @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let context = PersistenceController.shared

    //@StateObject var dataController = DataController()
   // @StateObject var observableInfo = ObservableInfo()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context.container.viewContext)
                .environmentObject(modelData)
            
        }
    }
}
