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
    @State var profileInspected = ModelData().inspectedProfile
  //  @State var profileHeader = (ModelData().inspectingSelf ? "My profile" : ModelData().inspectedProfile!.username)
    var body: some View {
        VStack{
            Text("profileHeader")
            HStack{
                VStack{
                    Image(profileInspected!.profilePicture)
                        .resizable()
                        .frame(maxHeight: 200)
                    Text(profileInspected!.username)
                }
                ScreenButton(rotation: 0, topColor: profileInspected!.topColor, bottomColor: profileInspected!.bottomColor, idealHeight: nil)
            }
            .frame(maxHeight: 300)
            if(profileInspected!.avaibleFriends.count > 0){
                Text("Friends: ")
            }
            else{
                Text("No friends yet")
            }
            ScrollView{
                ForEach(0..<profileInspected!.avaibleFriends.count, id: \.self){index in
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                            .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        HStack{
                            Text(profileInspected!.avaibleFriends[index].username)
                            Button("Inspect"){
                                modelData.inspectedProfile = profileInspected!.avaibleFriends[index]
                                profileInspected = profileInspected!.avaibleFriends[index]
                                modelData.inspectingSelf = false
                            }
                            Button("Remove"){
                                showingAlert = true
                            }
                            .alert("Delete this friend?", isPresented: $showingAlert){
                                Button("Yes", action:{profileInspected!.avaibleFriends.remove(at: index )})
                                Button("No", role: .cancel){}
                            }
                        }
                    }
                }
            }
            if(!modelData.inspectingSelf){
                Button("Add a friend", action:{modelData.viewRouter.currentPage = .addAFriend})
            }
        }
        .padding()
        .onAppear{
            if(modelData.inspectedProfile == nil){
                profileInspected = modelData.profile
            }
            else{
                profileInspected = modelData.inspectedProfile!
            }
        }
        Button("Back", action: {
            if(modelData.inspectingSelf){
                modelData.viewRouter.currentPage = .menuView
            }
            else{
                modelData.inspectingSelf = true
                modelData.inspectedProfile = modelData.profile
                profileInspected = modelData.profile
            }
            })
            .frame(alignment: .topLeading)
            .padding()
        
    }
       
        
}

/*
 .onChange(of: modelData.inspectedProfile, perform: {
     if(modelData.inspectedProfile == profile){
         modelData.inspectingSelf = true
     }
     else{
         inspectingSelf = false
 }})
 
 
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(Profile(username: "bebulo"))
    }
}
 */
