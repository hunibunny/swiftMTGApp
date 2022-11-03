//
//  NSObjectCreating.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import SwiftUI
import CoreData

func createNewProfile(name: String?, moc: NSManagedObjectContext, topColor: UIColor? = nil, bottomColor: UIColor? = nil, alwaysPermament: Bool? = false)->Profile{
    let newProfile = Profile(name: name ?? "New profile", topColor: topColor ?? UIColor.random, bottomColor: bottomColor ?? UIColor.random, alwaysPermament: alwaysPermament!, moc: moc)
    if moc.hasChanges{
        try! moc.save()
    }
    return newProfile
}


func createNewGame(name: String? = "Unnamed Game", moc: NSManagedObjectContext, players: Array<Profile>, hp: Double, hpArray: Array<String>?,  format: String?)->Game{
    let newGame = Game(name: name, moc: moc, format: format)
    var playerSet: Set<Profile> = []
    var hpSet: Set<HealthPoint> = []
    var round = 0
    for player in players{
        playerSet.insert(player)
        hpSet.insert(createNewHealthPoint(hp: hp , owner: player, moc: moc))
        //print("set here")
        //print(hpSet)
        //player.hp = Int32(hp ?? hpArray![round])!
        round += 1
    }

    newGame.addToProfilesPartOfGame(playerSet as NSSet)
    newGame.addToHpsPartOfGame(hpSet as NSSet)
    newGame.hpArray = healthPointSetToArray(listToChange: newGame.hpsPartOfGame as! Set<HealthPoint>)
    //try! moc.save()
    newGame.playerArray = profileSetToArray(listToChange: newGame.profilesPartOfGame as! Set<Profile>)
    //print("array lenght")
    //newGame.playerArray?[0].returnColors()
    return newGame
}

func createNewHealthPoint(hp: Double, owner: Profile, moc: NSManagedObjectContext)->HealthPoint{
    let newHealthPoint = HealthPoint(hp: hp, owner: owner, moc: moc)
    return newHealthPoint
}
