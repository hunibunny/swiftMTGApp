//
//  ProfileView.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    var body: some View {
        VStack{
            Text("My profile")
            HStack{
                VStack{
                    Image(modelData.profile.profilePicture)
                        .resizable()
                        .frame(maxHeight: 200)
                    Text(modelData.profile.username)
                }
                ScreenButton(rotation: 0, topColor: modelData.profile.topColor, bottomColor: modelData.profile.bottomColor, idealHeight: nil)
            }
            .frame(maxHeight: 300)
            if(modelData.profile.avaibleFriends.count > 0){
                Text("Friends: ")
            }
            else{
                Text("No friends yet")
            }
            ScrollView{
                ForEach(0..<modelData.profile.avaibleFriends.count, id: \.self){index in
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                            .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        HStack{
                            Text(modelData.profile.avaibleFriends[index].username)
                            Button("Inspect"){
                                modelData.inspectedProfile = modelData.profile.avaibleFriends[index]
                                modelData.viewRouter.currentPage = .profileView
                            }
                            Button("Remove"){
                                showingAlert = true
                            }
                            .alert("Delete this friend?", isPresented: $showingAlert){
                                Button("Yes", action:{modelData.profile.avaibleFriends.remove(at: index )})
                                Button("No", role: .cancel){}
                            }
                        }
                    }
                }
            }
            ZStack{
                Button("Add a friend", action:{modelData.viewRouter.currentPage = .addAFriend})
            }
        }
        .padding()
        Button("Back to menu", action: {modelData.viewRouter.currentPage = .menuView})
            .frame(alignment: .topLeading)
            .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
