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


func createNewGame(name: String = "New Game", maxHp: Double, moc: NSManagedObjectContext, playerArray: Array<Profile>, format: String?)->Game{
    var hpArray : Array<HealthPoint> = []
    for index in 0..<playerArray.count{
        hpArray.append(HealthPoint(hp: maxHp, player: playerArray[index], playerNumber: Double(index), moc: moc))
    }
    var playerArray: Array<Profile> = []
    for hp in hpArray{
        playerArray.append(hp.playerOwner!);
    }
    let newGame = Game(name: name, moc: moc, format: format, playerArray: playerArray, hpArray: hpArray)
    newGame.addToProfilesPartOfGame(Set(playerArray) as! NSSet)
    newGame.addToHpsPartOfGame(Set(hpArray) as! NSSet)
    return newGame
}

