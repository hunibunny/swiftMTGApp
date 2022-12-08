//
//  ChosenPlayers.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import CoreData
import SwiftUI

class chosenProfiles{
    private var chosenPlayers: Array<Profile> = []
    
    func returnChosenPlayers() -> Array<Profile>{
        return chosenPlayers
    }
    
    func addToChosenPlayers(toAdd: Profile, avaiblePlayers: Array<Profile>)->Array<Profile>{
        var toReturn = avaiblePlayers
        let index = Int(avaiblePlayers.firstIndex(of: toAdd)!)
        toReturn.remove(at: index)
        chosenPlayers.append(toAdd)
        return toReturn
    }
    
    func removeFromChosenPlayers(toRemove: Profile, avaiablePlayers: Array<Profile>)->Array<Profile>{
        var toReturn = avaiablePlayers
        toReturn.append(toRemove)
        let index = Int(chosenPlayers.firstIndex(of: toRemove)!)
        chosenPlayers.remove(at: index)
        return toReturn
    }
    
    func empty(avaiablePlayers: Array<Profile>)->Array<Profile>{
        var toReturn = avaiablePlayers
        for profile in chosenPlayers{
            toReturn.append(profile)
        }
        chosenPlayers = []
        return toReturn
    }
    
    func fillToLength(fillTo: Int, moc: NSManagedObjectContext){
        let rounds = fillTo-chosenPlayers.count
        if rounds > 0{
            for i in 1...rounds{
                let newProfile = createNewProfile(name: "Guest \(i)", moc: moc, alwaysPermament: false)
                chosenPlayers.append(newProfile)
            }
        }
    }
}
