//
//  ChosenPlayers.swift
//  MTGTracker
//
//  Created by Pirita on 31/08/2022.
//

import Foundation
import CoreData

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
        for i in 1...rounds{
            //let newProfile = Profile()
            let newProfile = Profile(context: moc)
            newProfile.name = "Guest \(i)"
            chosenPlayers.append(newProfile)
            print("Added \(i):st quest")
        }
    }
}
