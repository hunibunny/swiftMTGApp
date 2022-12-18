//
//  SetToArray.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 12/18/22.
//

import Foundation

func profileSetToArray(listToChange: Set<Profile>)->Array<Profile>{
    var returnArray: Array<Profile> = []
    for player in listToChange{
        returnArray.append(player)
    }
    return returnArray
}

func healthPointSetToArray(listToChange: Set<HealthPoint>)->Array<HealthPoint>{
    var returnArray: Array<HealthPoint> = []
    for hpData in listToChange{
        returnArray.append(hpData)
    }
    return returnArray
}
