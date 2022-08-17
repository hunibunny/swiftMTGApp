//
//  ProfileData.swift
//  MTGTracker
//
//  Created by Pirita on 09/08/2022.
//

import SwiftUI


struct Profile: Identifiable{
    var username: String = "profile name"
    var avaibleFriends: Array<Profile> = []
    var chosenFriends: Array<Profile> = []
    var chosenFriend = "No one"
    var profilePicture = "capybara"
    var topColor = UIColor.cyan
    var bottomColor = UIColor.green
    var hp = 20
    var specialDamage = 0
    var userId = "hehe"
    var id: String {userId}
}
