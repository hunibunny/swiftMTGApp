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
    @Binding var avaiablePlayers: Array<Profile>
    @State var playerAddedBack: Profile?
    var body: some View {
        Menu(chosenFriend){
            ForEach(0..<modelData.profiles.count, id: \.self){index in
                Button(action: {
                    if(!modelData.currentGame!.firstFriendHasBeenChosen){
                        modelData.profiles.append(Profile(username: "Choose a player"))
                        modelData.currentGame?.firstFriendHasBeenChosen = true
                    }
                    else{
                        for player in modelData.profiles{
                            if player.username == chosenFriend{
                                playerAddedBack = player
                                avaiablePlayers.append(playerAddedBack!)
                            }
                        }
                    }
                    modelData.currentGame!.chosenFriends.append(modelData.profiles[index])
                    //modelData.currentGame!.chosenFriends += modelData.profiles[index]
                    chosenFriend = modelData.profiles[index].username
                    toBeRemovedFromList = index
                    modelData.profiles.remove(at: index)
                }, label: {
                    Text(String(modelData.profiles[index].username))
                })
                .defaultStyling()
            }
        }
    }
}

