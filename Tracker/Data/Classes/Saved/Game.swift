//
//  GameData.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI
import CoreData



func profileSetToArray(listToChange: Set<Profile>)->Array<Profile>{
    var returnArray: Array<Profile> = []
    for player in listToChange{
        returnArray.append(player)
    }
    return returnArray
}



@objc
class Game: NSManagedObject{
    var playerArray: Array<Profile>? = []
    var hpArray: Array<HealthPoint>? = []
    
    convenience init(name: String, moc: NSManagedObjectContext, format: String?, playerArray : Array<Profile>, hpArray : Array<HealthPoint>){
        self.init(entity: NSEntityDescription.entity(forEntityName: "GameData", in: moc)!, insertInto: moc)
        self.gameName = name
        self.format = format ?? "No format"
        self.ammountOfPlayers = ammountOfPlayers
        self.playerArray = playerArray
        self.hpArray = hpArray
    }
}
