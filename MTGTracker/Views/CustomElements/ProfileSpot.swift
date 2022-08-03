//
//  ProfileSpot.swift
//  MTGTracker
//
//  Created by Pirita on 03/08/2022.
//

import SwiftUI

struct ProfileSpot: View{
    @EnvironmentObject var viewRouter: ViewRouter
    @State var profileName = "Choose a player"
    var body: some View {
        Menu(profileName){
            ForEach(1...$viewRouter.avaibleFriends.count, id: \.self){playerNumberInList in
                Button(action: {
                    viewRouter.avaibleFriends.remove(at: playerNumberInList-1)
                    if profileName != "Choose a player"{
                        viewRouter.avaibleFriends.append(profileName)
                    }
                    //profileName =
                    print(viewRouter._avaibleFriends.wrappedValue)//[playerNumberInList-1])

                }, label: {
                    Text(String(viewRouter.avaibleFriends[playerNumberInList-1]))
                })
            }
        }
    }
}

struct ProfileSpot_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSpot()
    }
}
