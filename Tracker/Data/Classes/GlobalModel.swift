//
//  GlobalModel.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import SwiftUI
import CoreData

class ModelData: ObservableObject{
    @Published var inspectedProfile: Profile?
    @Published var inspectingSelf = false
    @Published var viewRouter = ViewRouter()
    @Published var sizesOfViews = []
    @Published var showDices = false
    @Published var currentGame: Game?
    @Published var profiles: Array<Profile> = []
    @Published var editedProfile: Profile?
    @Published var editingProfile = false
    @Published var savedGames: Array<Game> = []
    @Published var container = NSPersistentContainer(name: "tracker")
    @Published var nameOfEditedProfile: String?
}
