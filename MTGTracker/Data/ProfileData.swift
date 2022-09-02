//
//  ProfileData.swift
//  MTGTracker
//
//  Created by Pirita on 09/08/2022.
//

import SwiftUI
import CoreData



class Profile: NSManagedObject, Identifiable{
    @NSManaged var testAttribute: String
    var name = "no name set :)"
    var topColor = UIColor.green
    var bottomColor = UIColor.blue
    var hp = 20
    var specialDamage = 0
    var userId = "hehe"
    var id = UUID().uuidString
   // let fetchRequest: NSFetchRequest<Self> = NSFetchRequest(entityName: Self.username)
    
    static func ==(lhs: Profile, rhs: Profile) -> Bool {
        return lhs.name == rhs.name
    }
}


