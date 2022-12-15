//
//  ProfileData.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//
//Users/pirita/Documents/xCodes/MTGTracker/MTGTracker/Data/ProfileData.swift:    // let fetchRequest: NSFetchRequest<Self> = NSFetchRequest(entityName: Self.username)
import SwiftUI
import CoreData

class Profile: NSManagedObject{
    convenience init(name: String, topColor: UIColor, bottomColor: UIColor, alwaysPermament: Bool, moc: NSManagedObjectContext) {
        self.init(entity: NSEntityDescription.entity(forEntityName: "ProfileData", in: moc)!, insertInto: moc)
        self.bottomDataColor = bottomColor.encode;
        self.topDataColor = topColor.encode;
        self.name = name
        self.alwaysPermament = alwaysPermament
        self.permament = true
    }
}

