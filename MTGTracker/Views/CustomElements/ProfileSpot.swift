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
 //   @State private var avaibleFriends: Array<String> = []
   // @State private var chosenFriends: Array<String> = []
    
    var body: some View {
        Menu(profileName){
            ForEach(1..<$viewRouter.avaibleFriends.count, id: \.self){index in
                Button(action: {
                    if(self.viewRouter.chosenFriends == []){
                        self.viewRouter.avaibleFriends.append(profileName)
                    }
                    profileName = self.viewRouter.avaibleFriends[index-1]
                    let indexOfRemovedName = self.viewRouter.avaibleFriends.firstIndex(of: profileName)
                    self.viewRouter.avaibleFriends.remove(at: indexOfRemovedName ?? 0)
                    self.viewRouter.chosenFriends.append(profileName)
                }, label: {
                    Text(String(self.viewRouter.avaibleFriends[index-1]))
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
/*
 var names = ["apple", "banana", "cherry", "mango"]
 var e = "guava";
 if let index = names.firstIndex(of: e) {
     print("Index of '\(e)' is \(index).")
 } else {
     print("Element is not present in the array.")
 }
 */
