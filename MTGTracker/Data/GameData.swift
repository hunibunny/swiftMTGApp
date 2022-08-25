//
//  GameData.swift
//  MTGTracker
//
//  Created by Pirita on 24/08/2022.
//

import SwiftUI

var firstPlayer = Profile(topColor: UIColor.red, bottomColor: UIColor.gray)
var secondPlayer = Profile(topColor: UIColor.blue, bottomColor: UIColor.white)
var thirdPlayer = Profile(topColor: UIColor.green, bottomColor: UIColor.orange)


struct GameData{
    var players: Array<Profile> = []
    var hp = [0, 0, 0, 0]
    var name: String?
    var format = "Choose format"
    var ammountOfPlayers = 0
}

