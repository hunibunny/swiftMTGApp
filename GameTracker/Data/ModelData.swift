//
//  ModelData.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import Foundation
import Combine
import SwiftUI
import CoreData

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
    @Published var container = NSPersistentContainer(name: "GameTracker")
    //@Published var dataController = DataController()
}




