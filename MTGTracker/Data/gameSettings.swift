//
//  GameSettings.swift
//  MTGTracker
//
//  Created by Pirita on 16/08/2022.
//

import SwiftUI

var firstPlayer = Profile(topColor: UIColor.red, bottomColor: UIColor.gray)
var secondPlayer = Profile(topColor: UIColor.blue, bottomColor: UIColor.white)
var thirdPlayer = Profile(topColor: UIColor.green, bottomColor: UIColor.orange)

struct GameSettings{
    var gameMode = "Standard"
    var ammountOfPlayers = 2
    var players: Array<Profile> = [Profile(),firstPlayer, secondPlayer, thirdPlayer]
    
}

