//
//  SaveGame.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/27/22.
//

import Foundation
import CoreData

func saveGame(game: Game, moc: NSManagedObjectContext){
    for player in game.playerArray!{
        player.permament = true
    }
    for hpToRemove in healthPointSetToArray(listToChange: game.hpsPartOfGame as! Set<HealthPoint>){
        game.removeFromHpsPartOfGame(hpToRemove)
    }
    for hp in game.hpArray!{
        game.addToHpsPartOfGame(hp)
    }
    if moc.hasChanges{
        try! moc.save()
    }
    
}
