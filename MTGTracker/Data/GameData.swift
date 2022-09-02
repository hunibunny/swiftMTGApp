//
//  GameData.swift
//  MTGTracker
//
//  Created by Pirita on 24/08/2022.
//

import SwiftUI

struct GameData{
    var players: Array<Profile> = []
    var hp = [0, 0, 0, 0]
    var name: String?
    var format = "Choose format"
    var ammountOfPlayers = 0
    var chosenFriends: Array<Profile> = []
    var firstFriendHasBeenChosen = false
}

