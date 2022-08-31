//
//  ChosenProfile.swift
//  MTGTracker
//
//  Created by Pirita on 30/08/2022.
//

import SwiftUI

struct ChosenProfile: View {
    @EnvironmentObject var modelData: ModelData
    @State var chosenFriend = "Choose a player"
    @State var toBeRemovedFromList = 0
    @State var playerAddedBack: Profile?
    @Binding var chosenPlayers: chosenProfiles
    @State var location: Int
    @State var currentPlayer: Profile?
    @State var buttonText = "Couldn't find the name"
    var body: some View {
        Menu(buttonText){
            ForEach(0..<modelData.profiles.count, id: \.self){index in
                Button(action: {
                    currentPlayer = modelData.profiles[index]
                    buttonText = currentPlayer?.username ?? "Select player"
                    chosenPlayers.addToChosenPlayers(toAdd: modelData.profiles[index])
                }, label: {
                    Text(modelData.profiles[index].username)
                })
            }
            Button("Choose a player", action:{
                if currentPlayer != nil{
                    chosenPlayers.removeFromChosenPlayers(toRemove: currentPlayer!)
                    currentPlayer = nil
            }})
        }
    }
}

/*
// first lets join arr2 and arr3 to a dictionary
var dict: [Int: String] = [:]
zip(arr2, arr3).forEach({ (pair) in
    dict[pair.0] = pair.1
})
*/
