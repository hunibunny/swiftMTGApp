//
//  DeleteData.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 12/16/22.
//

import Foundation
import CoreData

func deleteAllProfiles(moc: NSManagedObjectContext){
    var profiles: Array<Profile> = []
    do{
        profiles =
        try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
    }
    catch{
        print("delete profiles failed")
    }
    for profile in profiles{
        moc.delete(profile)
    }
}

func deleteAllGames(moc: NSManagedObjectContext){
    var profiles: Array<Game> = []
    do{
        profiles =
        try moc.fetch(NSFetchRequest(entityName: "GameData"))
    }
    catch{
        print("deleting all games failed")
    }
  
    for profile in profiles{
        moc.delete(profile)
    }
}

func deleteAllHealthPoints(moc: NSManagedObjectContext){
    var profiles: Array<HealthPoint> = []
    do{
        profiles =
        try moc.fetch(NSFetchRequest(entityName: "HealthPointData"))
    }
    catch{
        print("delete all healthpoints")
    }

    for profile in profiles{
        moc.delete(profile)
    }
}

func deleteEverything(moc: NSManagedObjectContext){
    deleteAllProfiles(moc: moc)
    deleteAllGames(moc: moc)
    deleteAllHealthPoints(moc: moc)
}
