//
//  ProfileSpot.swift
//  MTGTracker
//
//  Created by Pirita on 03/08/2022.
//

import SwiftUI

struct ProfileSpot: View{
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenFriend = "Choose a player"
    
    @State var avaibleFriendsForMe: Array<String> = []
    
    init(){
        self.avaibleFriendsForMe = avaibleFriendsForMe
    }
    
    var body: some View{
        Menu(chosenFriend){
            ForEach(0..<self.avaibleFriendsForMe.count, id: \.self){index in
                Button(action: {
                    print(self.avaibleFriendsForMe[index])
                    chosenFriend = self.avaibleFriendsForMe[index]
                    if(self.chosenFriend.count == 0){
                        self.avaibleFriendsForMe.append("Choose a player")
                    }
                    if(!viewRouter.chosenFriends.contains(chosenFriend)){
                        viewRouter.chosenFriends.append(chosenFriend)
                        print(viewRouter.chosenFriends)
                        viewRouter.chosenFriend = chosenFriend
                    }
                    if(self.avaibleFriendsForMe.contains(chosenFriend)){
                        let indexOfRemovedName = self.avaibleFriendsForMe.firstIndex(of: chosenFriend)
                        self.avaibleFriendsForMe.remove(at: indexOfRemovedName ?? 0)
                    }
                }, label: {
                    Text(String(self.avaibleFriendsForMe[index]))
                })
            }
        }
        .onAppear{
            self.avaibleFriendsForMe = viewRouter.avaibleFriends
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

/*
 Menu(chosenFriend){
     ForEach(0..<$viewRouter.avaibleFriends.count, id: \.self){index in
         Button(action: {
             print(viewRouter.avaibleFriends)
             chosenFriend = self.viewRouter.avaibleFriends[index]
             if(viewRouter.chosenFriends.count == 0){
                 viewRouter.avaibleFriends.append("Choose a player")
             }
             if(!viewRouter.chosenFriends.contains(chosenFriend)){
                 viewRouter.chosenFriends.append(chosenFriend)
                 print(viewRouter.chosenFriends)
             }
             if(viewRouter.avaibleFriends.contains(chosenFriend)){
                 let indexOfRemovedName = viewRouter.avaibleFriends.firstIndex(of: chosenFriend)
                 viewRouter.avaibleFriends.remove(at: indexOfRemovedName ?? 0)
             }
         }, label: {
             Text(String(viewRouter.avaibleFriends[index]))
         })
     }
 }
 */
