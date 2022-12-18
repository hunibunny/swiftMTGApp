//
//  GameData.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI
import CoreData


@objc
class Game: NSManagedObject{
    var playerArray: Array<Profile>? = []
    var hpArray: Array<HealthPoint>? = []
    
    convenience init(name: String, moc: NSManagedObjectContext, format: String?, playerArray : Array<Profile>, hpArray : Array<HealthPoint>){
        self.init(entity: NSEntityDescription.entity(forEntityName: "GameData", in: moc)!, insertInto: moc)
        self.gameName = name
        self.format = format ?? "No format"
        self.ammountOfPlayers = Double(playerArray.count)
        self.playerArray = playerArray
        self.hpArray = hpArray
    }
}
