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
    var specialDamage = 0
    var userId = "hehe"
    var id = UUID().uuidString
    var bottomUIColor: UIColor = UIColor.random;
    var topUIColor: UIColor = UIColor.random;

    convenience init(name: String, topColor: UIColor, bottomColor: UIColor, alwaysPermament: Bool, moc: NSManagedObjectContext) {
        self.init(entity: NSEntityDescription.entity(forEntityName: "ProfileData", in: moc)!, insertInto: moc)
        self.specialDamage =  0
        self.userId = "hehe"
        self.id = UUID().uuidString
        self.bottomDataColor = bottomColor.encode;
        self.topDataColor = topColor.encode;
        self.topUIColor = topColor;
        self.bottomUIColor = bottomColor;
        self.name = name
        self.alwaysPermament = alwaysPermament
        self.permament = true
    }
}

