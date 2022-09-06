//
//  ProfileData.swift
//  MTGTracker
//
//  Created by Pirita on 09/08/2022.
//

import SwiftUI
import CoreData





@objc
class Profile: NSManagedObject{
    var topColor = UIColor.green
    var bottomColor = UIColor.blue
    var hp = 20
    var specialDamage = 0
    var userId = "hehe"
    var id = UUID().uuidString
    // let fetchRequest: NSFetchRequest<Self> = NSFetchRequest(entityName: Self.username)
     
   //  static func ==(lhs: Profile, rhs: Profile) -> Bool {
     //    return lhs.name == rhs.name
     //}
 }
 
 /*
 let moc = …
 let employeesFetch = NSFetchRequest(entityName: "Employee")
  
 do {
     let fetchedEmployees = try moc.executeFetchRequest(employeesFetch) as! [EmployeeMO]
 } catch {
     fatalError("Failed to fetch employees: \(error)")
 }
 
 
 
 
 let firstName = "Trevor"
 fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
 */
