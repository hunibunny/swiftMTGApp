//
//  ViewRouter.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import SwiftUI

var stPlayer = Profile(username: "Ella", topColor: UIColor.red, bottomColor: UIColor.gray)
var ndPlayer = Profile(username: "Fawn", topColor: UIColor.blue, bottomColor: UIColor.white)
var rdPlayer = Profile(username: "Gaia", topColor: UIColor.green, bottomColor: UIColor.orange)

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .menuView
    @Published var numberOfPages = Page.allCases.count
    @Published var allPages = Page.allCases
    @Published var profile = Profile(username: "mel mle", avaibleFriends: [stPlayer, ndPlayer, rdPlayer])
    @Published var inspectedProfile: Profile?
    @Published var gameSettings = GameSettings()
}


//, LosslessStringConvertible
