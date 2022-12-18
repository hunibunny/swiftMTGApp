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
        print("rip")
    }
    
   for profile in fetchedData{
        if !profile.permament{
            for hp in healthPointSetToArray(listToChange: profile.hpInGame as! Set<HealthPoint>){
                print("deleted player part of a game: " + (hp.gamePartOf?.gameName ?? "no name found"))
            }
            moc.delete(profile)
            try! moc.save()
            
        }
    }
    
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "ProfileData"))
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
    }
    catch {
        print("rip")
    }
    for game in fetchedData{
        //print(healthPointSetToArray(listToChange: game.hpsPartOfGame as! Set<HealthPoint>).count)
        if healthPointSetToArray(listToChange: game.hpsPartOfGame as! Set<HealthPoint>).count > 0{
            for healthPoint in healthPointSetToArray(listToChange: game.hpsPartOfGame as! Set<HealthPoint>){
                game.hpArray?.append(healthPoint)
            }
            game.hpArray! = (game.hpArray?.sorted(by: {$0.playerNumber < $1.playerNumber}))!
            for healthPoint in game.hpArray!{
                game.playerArray?.append(healthPoint.playerOwner!)
            }
            for index in 0..<game.hpArray!.count{
                print("here")
                print(game.hpArray?[index].hp)
                print(game.hpArray?[index].playerOwner)
            }
            try! moc.save()
        }
    }
   
    
    do {
        fetchedData =
        try moc.fetch(NSFetchRequest(entityName: "GameData"))
    }
    catch {
        print("rip")
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
        print("rip")
    }
    return fetchedData
    
}
