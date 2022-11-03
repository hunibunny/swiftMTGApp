//
//  AppDelegate.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import SwiftUI
import CoreData

class AppDelegate: NSObject, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //print("Your code here")
        return true
    }
    
    //Saving the context in the UIApplicationDelegate methods applicationDidEnterBackground: and applicationWillTerminate: has always been fine for me. I also save in special circumstances like a big data import or something similar.
}

