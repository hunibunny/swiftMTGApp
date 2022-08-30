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
    @Published var inspectedProfile: Profile?
    @Published var inspectingSelf = false
    @Published var viewRouter = ViewRouter()
    @Published var sizesOfViews = []
    @Published var showDices = false
    @Published var currentGame: GameData?
    @Published var profiles: Array<Profile> = []
    @Published var editedProfile: Profile?
    @Published var editingProfile = false
}




func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

