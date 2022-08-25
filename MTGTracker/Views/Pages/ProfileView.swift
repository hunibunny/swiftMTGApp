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
    @State var pfpSize: CGSize?  //  @State var profileHeader = (ModelData().inspectingSelf ? "My profile" : ModelData().inspectedProfile!.username)
    @State var itemNumberToDelete = 0
    var body: some View {
        VStack{
            VStack{
                Text(profileInspected!.username).padding()
                HStack{
                    GeometryReader{geometry in
                        Image(profileInspected!.profilePicture)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(idealWidth: UIScreen.screenWidth/2)
                            .onAppear{
                                pfpSize = geometry.size
                            }
                    }
                    ScreenButton(rotation: 0, topColor: profileInspected!.topColor, bottomColor: profileInspected!.bottomColor, idealHeight: nil, hp: 20)
                        .frame(height: pfpSize?.height)
                }
                //.padding()
            }
           // .frame(maxHeight: 300)
            .padding(.bottom, nil)
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
                            Text(profileInspected!.avaibleFriends[index].username).padding()
                            Spacer()
                            Button("Inspect"){
                                modelData.inspectedProfile = profileInspected!.avaibleFriends[index]
                                profileInspected = profileInspected!.avaibleFriends[index]
                                modelData.inspectingSelf = false
                            }
                            .defaultStyling()
                            Button("Remove"){
                                showingAlert = true
                                itemNumberToDelete = index
                            }
                            .defaultStyling()
                            
                            .alert("Delete this friend?", isPresented: $showingAlert){
                                Button("Yes", action:{profileInspected!.avaibleFriends.remove(at: itemNumberToDelete)})
                                    .defaultStyling()
                                Button("No", role: .cancel){}
                                    .defaultStyling()
                            }
                        }
                    }
                }
            }
            .padding(.leading, nil)
            .padding(.trailing, nil)
            if(modelData.inspectedProfile == modelData.profile){
                Button("Add a friend", action:{modelData.viewRouter.currentPage = .addAFriend})
                    .defaultStyling(paddingAmmount: 0)
            }
        }
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
        .defaultStyling()
        .frame(alignment: .topLeading)
        
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
