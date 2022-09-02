//
//  ProfileData.swift
//  MTGTracker
//
//  Created by Pirita on 09/08/2022.
//

import SwiftUI
import CoreData


struct Profile: Identifiable, Equatable{
    var name: String = "profile name"
    var profilePicture = "capybara"
    var topColor = UIColor.cyan
    var bottomColor = UIColor.green
    var hp = 20
    var specialDamage = 0
    var userId = "hehe"
    var id = UUID().uuidString
   // let fetchRequest: NSFetchRequest<Self> = NSFetchRequest(entityName: Self.username)
    static func ==(lhs: Profile, rhs: Profile) -> Bool {
        return lhs.name == rhs.name
    }
}


