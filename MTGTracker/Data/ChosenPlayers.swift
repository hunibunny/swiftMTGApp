//
//  ChosenPlayers.swift
//  MTGTracker
//
//  Created by Pirita on 31/08/2022.
//

import Foundation

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
    
    func fillToLength(fillTo: Int){
        let rounds = fillTo-chosenPlayers.count
        for i in 1...rounds{
            chosenPlayers.append(Profile(name: "Guest \(i)"))
            print("Added \(i):st quest")
        }
    }
}
