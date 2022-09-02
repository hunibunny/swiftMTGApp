//
//  DataController.swift
//  MTGTracker
//
//  Created by Pirita on 02/09/2022.
//

import CoreData
import Foundation

class DataController{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription) ")
            }
            
        }
    }
}
