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
    }
    catch {
        print("profile data load failed")
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
    }
    catch {
        print("profile data load failed")
    }
    
    return fetchedData
}


func loadGameData(moc: NSManagedObjectContext)->Array<Game>{
    var fetchedData: Array<Game> = []
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "GameData"))
    }
    catch {
        print("game data load failed")
    }
    for index in 0..<fetchedData.count{
        let game = fetchedData[index]
        if healthPointSetToArray(listToChange: game.hpsPartOfGame as! Set<HealthPoint>).count > 0{
            game.hpArray = healthPointSetToArray(listToChange: game.hpsPartOfGame as! Set<HealthPoint>)
            game.hpArray = (game.hpArray?.sorted(by: {$0.playerNumber < $1.playerNumber}))!
            for healthPoint in game.hpArray!{
                game.playerArray?.append(healthPoint.playerOwner!)
            }
            try! moc.save()
        }
    }
   
    
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "GameData"))
    }
    catch {
        print("game data load failed")
    }
    return fetchedData
}

func loadHealthPointsOfGame(moc: NSManagedObjectContext)->Array<HealthPoint>{
    var fetchedData: Array<HealthPoint> = []
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "HealthPointData"))
    }
    catch {
        print("game data load failed")
    }
    return fetchedData
    
}
