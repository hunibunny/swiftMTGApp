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


func createNewGame(name: String = "New Game", moc: NSManagedObjectContext, hp: Double, hpArray: Array<HealthPoint>,  format: String?)->Game{
    var playerArray: Array<Profile> = []
    for hp in hpArray{
        playerArray.append(hp.playerOwner!);
    }
    //print(name)
    let newGame = Game(name: name, moc: moc, format: format, playerArray: playerArray, hpArray: hpArray)
    //print(name)
    var playerSet: Set<Profile> = []
    var hpSet: Set<HealthPoint> = []
    var round = 0
    for player in playerArray{
        playerSet.insert(player)
        hpSet.insert(HealthPoint(hp: hp, player: player, playerNumber: Double(round), moc: moc))
        round += 1
    }
    newGame.addToProfilesPartOfGame(playerSet as NSSet)
    newGame.addToHpsPartOfGame(hpSet as NSSet)
    newGame.hpArray = healthPointSetToArray(listToChange: newGame.hpsPartOfGame as! Set<HealthPoint>)
    newGame.playerArray = profileSetToArray(listToChange: newGame.profilesPartOfGame as! Set<Profile>)
    newGame.ammountOfPlayers = Double(newGame.playerArray!.count)
    return newGame
}

