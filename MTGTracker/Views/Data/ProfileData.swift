//
//  ProfileData.swift
//  MTGTracker
//
//  Created by Pirita on 09/08/2022.
//

import SwiftUI


struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    var avaibleFriends: Array<String> = ["Anna", "Ben", "Cassandra", "Daniel"]
    var chosenFriends: Array<String> = []
    var chosenFriend = "No one"
    var profilePicture = "capybara"
    var topColor = UIColor.cyan
    var bottomColor = UIColor.green
    
    static let `default` = Profile(username: "g_kumar")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}


class ProfileData: ObservableObject{
    @Published var profile = Profile(username: "Bebu")
}
