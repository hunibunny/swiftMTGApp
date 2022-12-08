//
//  SaveGame.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/27/22.
//

import Foundation
import CoreData

//onko tarpeellinen :D?
func saveGame(currentGame: Game, moc: NSManagedObjectContext){
    for player in currentGame.playerArray!{
        player.permament = true
    }
    if moc.hasChanges{
        try! moc.save()
    }
    
}
