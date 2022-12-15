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


func createNewGame(name: String = "Unnamed game", moc: NSManagedObjectContext, players: Array<Profile>, hp: Double, hpArray: Array<HealthPoint>,  format: String?)->Game{
    let newGame = Game(name: name, moc: moc, format: format, playerArray: players, hpArray: hpArray)
    print(name)
    var playerSet: Set<Profile> = []
    var hpSet: Set<HealthPoint> = []
    var round = 0
    for player in players{
        playerSet.insert(player)
        hpSet.insert(HealthPoint(hp: hp, player: player, moc: moc))
        round += 1
    }
    newGame.addToProfilesPartOfGame(playerSet as NSSet)
    newGame.addToHpsPartOfGame(hpSet as NSSet)
    newGame.hpArray = healthPointSetToArray(listToChange: newGame.hpsPartOfGame as! Set<HealthPoint>)
    newGame.playerArray = profileSetToArray(listToChange: newGame.profilesPartOfGame as! Set<Profile>)
    newGame.ammountOfPlayers = Double(newGame.playerArray!.count)
    return newGame
}

