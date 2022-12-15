//
//  LoadData.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import CoreData

func loadProfileData(moc: NSManagedObjectContext)->Array<Profile>{
    var fetchedData: Array<Profile> = []
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
        //modelData.profiles = fetchedData
        //modelData.profiles = try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
        //print(fetchedData)
    }
    catch {
        print("rip")
    }
    
   for profile in fetchedData{
        if !profile.permament{
            moc.delete(profile)
            try! moc.save()
            
        }
    }
    
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
        //modelData.profiles = fetchedData
        //modelData.profiles = try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
        //print(fetchedData)
    }
    catch {
        print("rip2")
    }
    
    return fetchedData
}


func loadGameData(moc: NSManagedObjectContext)->Array<Game>{
    var fetchedData: Array<Game> = []
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "GameData"))
        //modelData.profiles = fetchedData
        //modelData.profiles = try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
        //print(fetchedData)
        //for game in fetchedData{
           // game. loadPlayersOfGame(gameToGetPlayersFrom: game, moc: moc)
        //}
    }
    catch {
        print("rip")
    }
    return fetchedData
}

func loadHealthPointsOfGame(){
//for(health)
}

func loadPlayersOfGame(gameToGetPlayersFrom: Game  , moc: NSManagedObjectContext)-> Array<Profile> {
    let fetchedData: Array<Profile> = profileSetToArray(listToChange: gameToGetPlayersFrom.profilesPartOfGame as! Set<Profile>)
    return fetchedData
}

/*
extension Game{
    public var players:[Profile]{
        let set = gameToProfile as? Set<Profile> ?? []
        return profileSetToArray(listToChange: set)
        //set.sorted{$wrappedName < $1.wrappedName}
    }
}
 */
