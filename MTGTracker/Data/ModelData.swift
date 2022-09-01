//
//  ModelData.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import Foundation
import Combine
import SwiftUI


var stPlayer = Profile(username: "Ella", topColor: UIColor.red, bottomColor: UIColor.gray)
var ndPlayer = Profile(username: "Fawn", topColor: UIColor.blue, bottomColor: UIColor.white)
var rdPlayer = Profile(username: "Gaia", topColor: UIColor.green, bottomColor: UIColor.orange)

class ModelData: ObservableObject{
    @Published var inspectedProfile: Profile? //nah
    @Published var inspectingSelf = false  //nah
    @Published var viewRouter = ViewRouter()  //nah
    @Published var sizesOfViews = []    //nah
    @Published var showDices = false   //nah
    @Published var currentGame: GameData? //nah
    @Published var profiles: Array<Profile> = []  //yes
    @Published var editedProfile: Profile?  //nah
    @Published var editingProfile = false   //nah
    @Published var savedGames: Array<GameData> = [] //yes
}




