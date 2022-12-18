//
//  HealthPoint.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import CoreData


@objc
class HealthPoint: NSManagedObject{
    convenience init(hp: Double, player: Profile, playerNumber: Double, moc: NSManagedObjectContext){
        self.init(entity: NSEntityDescription.entity(forEntityName: "HealthPointData", in: moc)!, insertInto: moc)
        self.hp = hp
        self.playerOwner = player
        self.playerNumber = playerNumber
    }
}

