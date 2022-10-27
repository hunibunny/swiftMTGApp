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
    
    func addToChosenPlayers(toAdd: Profile){
        chosenPlayers.append(toAdd)
        print("added \(toAdd)")
    }
    
    func removeFromChosenPlayers(toRemove: Profile){
        let index = Int(chosenPlayers.firstIndex(of: toRemove)!)
        chosenPlayers.remove(at: index)
        print("removed \(toRemove) from \(String(describing: index))")
    }
    
    func empty(){
        chosenPlayers = []
    }
    
    func fillToLength(fillTo: Int, moc: NSManagedObjectContext){
        let rounds = fillTo-chosenPlayers.count
        if rounds > 0{
            for i in 1...rounds{
                let newProfile = createNewProfile(name: "Guest \(i)", moc: moc, alwaysPermament: false)
                chosenPlayers.append(newProfile)
                print("Added \(i):st quest")
            }
        }
    }
}
