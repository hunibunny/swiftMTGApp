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

    convenience init(name: String, topColor: UIColor, bottomColor: UIColor, alwaysPermament: Bool, moc: NSManagedObjectContext) {
        self.init(entity: NSEntityDescription.entity(forEntityName: "ProfileData", in: moc)!, insertInto: moc)
        self.specialDamage =  0
        self.userId = "hehe"
        self.id = UUID().uuidString
        self.bottomDataColor = bottomColor.encode;
        self.topDataColor = topColor.encode;
        self.name = name
        self.alwaysPermament = alwaysPermament
        self.permament = true
    }
    /*
    func returnTopUIColor()->UIColor{
        return self.topUIColor!
    }
    
    func returnBottomUIColor()->UIColor{
        return self.bottomUIColor!
    }
     */

}

// convert to data NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blackColor]];
// convert to UIColor UIColor *theColor = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:theData];
