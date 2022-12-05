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
    var topUIColor: UIColor?;
    var bottomUIColor: UIColor?;
    
    convenience init(name: String, topColor: UIColor, bottomColor: UIColor, alwaysPermament: Bool, moc: NSManagedObjectContext) {
        self.init(entity: NSEntityDescription.entity(forEntityName: "ProfileData", in: moc)!, insertInto: moc)
        self.specialDamage =  0
        self.userId = "hehe"
        self.id = UUID().uuidString
        self.bottomUIColor = bottomColor;
        self.topUIColor = topColor;
        self.name = name
        self.alwaysPermament = alwaysPermament
        self.permament = alwaysPermament ? true : false

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
