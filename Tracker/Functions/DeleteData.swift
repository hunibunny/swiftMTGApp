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
        print("bruh")
    }
    do{
        for profile in profiles{
            try moc.delete(profile)
            }
    }
    catch{
        print("bruh")
    }
}

func deleteAllGames(moc: NSManagedObjectContext){
    var profiles: Array<Game> = []
    do{
        profiles =
        try moc.fetch(NSFetchRequest(entityName: "GameData"))
    }
    catch{
        print("bruh")
    }
    do{
        for profile in profiles{
            try moc.delete(profile)
            }
    }
    catch{
        print("bruh")
    }
}

func deleteAllHealthPoints(moc: NSManagedObjectContext){
    var profiles: Array<HealthPoint> = []
    do{
        profiles =
        try moc.fetch(NSFetchRequest(entityName: "HealthPointData"))
    }
    catch{
        print("bruh")
    }
    do{
        for profile in profiles{
            try moc.delete(profile)
            }
    }
    catch{
        print("bruh")
    }
}

func deleteEverything(moc: NSManagedObjectContext){
    deleteAllProfiles(moc: moc)
    deleteAllGames(moc: moc)
    deleteAllHealthPoints(moc: moc)
}
