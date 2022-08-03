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
            ForEach(1...$viewRouter.avaibleFriends.count, id: \.self){index in
                Button(action: {
                    viewRouter.avaibleFriends.remove(at: index-1)
                    print(viewRouter.avaibleFriends[index-1])
                    print($viewRouter.avaibleFriends.count)
                    viewRouter.avaibleFriends.append(profileName)
                    profileName = viewRouter.avaibleFriends[index-1]

                }, label: {
                    Text(String(viewRouter.avaibleFriends[index-1]))
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
