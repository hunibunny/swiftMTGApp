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
    //var topColor = UIColor.green
    //var bottomColor = UIColor.blue
    var specialDamage = 0
    var userId = "hehe"
    var id = UUID().uuidString
    
    convenience init(name: String, topColor: UIColor, bottomColor: UIColor, permament: Bool, moc: NSManagedObjectContext) {
        self.init(entity: NSEntityDescription.entity(forEntityName: "ProfileData", in: moc)!, insertInto: moc)
        self.specialDamage =  0
        self.userId = "hehe"
        self.id = UUID().uuidString
        self.bottomColor = bottomColor
        self.topColor = topColor
        self.name = name
        self.permament = permament
    }
    
    func returnTopColor()->UIColor{
        return self.topColor as! UIColor
    }
    
    func returnBottomColor()->UIColor{
        return self.bottomColor as! UIColor
    }
}
