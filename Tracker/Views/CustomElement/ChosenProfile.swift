//
//  ChosenProfile.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

struct ChosenProfile: View {
    @EnvironmentObject var modelData: ModelData
    @State var playerAddedBack: Profile?
    @Binding var chosenPlayers: chosenProfiles
    @State var location: Int
    @State var currentPlayer: Profile?
    @State private var buttonText = "Quest"
    @State var lastPlayer: Profile?
    var body: some View {
        Menu(buttonText){
            ForEach(modelData.profiles){profile in
                if(profile.alwaysPermament && modelData.avaiablePlayers.contains(profile)){
                    Button(action: {
                        buttonText = profile.name ?? "Unnamed Profile"
                        modelData.avaiablePlayers = chosenPlayers.addToChosenPlayers(toAdd: profile, avaiblePlayers: modelData.avaiablePlayers)
                        if(lastPlayer != nil){
                            if(!modelData.avaiablePlayers.contains(lastPlayer!)){
                                modelData.avaiablePlayers.append(lastPlayer!)
                            }
                        }
                        lastPlayer = profile
                    }, label: {
                        Text(profile.name ?? "Unnamed Profile")
                    })
                }
            }
        }
    }
}
