//
//  HealthPoint.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import CoreData


func healthPointSetToArray(listToChange: Set<HealthPoint>)->Array<HealthPoint>{
    var returnArray: Array<HealthPoint> = []
    for hpData in listToChange{
        returnArray.append(hpData)
    }
    return returnArray
}

@objc
class HealthPoint: NSManagedObject{
    convenience init(hp: Double, owner: Profile, moc: NSManagedObjectContext){
        self.init(entity: NSEntityDescription.entity(forEntityName: "HealthPointData", in: moc)!, insertInto: moc)
        self.hp = hp
        self.owner = owner
    }
}

