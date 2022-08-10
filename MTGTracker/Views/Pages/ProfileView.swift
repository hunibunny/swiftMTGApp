//
//  ProfileView.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showingAlert = false
    var body: some View {
        VStack{
            Text("My profile")
            HStack{
                VStack{
                    Image(viewRouter.profile.profilePicture)
                        .resizable()
                        .frame(maxHeight: 200)
                    Text(viewRouter.profile.username)
                }
                ScreenButton(rotation: 0, topColor: viewRouter.profile.topColor, bottomColor: viewRouter.profile.bottomColor, idealHeight: nil)
            }
            .frame(maxHeight: 300)
            Text("Friends: ")
            ScrollView{
                ForEach(0..<viewRouter.profile.avaibleFriends.count, id: \.self){index in
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                            .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        HStack{
                            Text(viewRouter.profile.avaibleFriends[index])
                            Button("See", action:{})
                            Button("Remove"){
                                showingAlert = true
                            }
                            .alert("Are you sure?", isPresented: $showingAlert){
                                Button("Yes", role: .cancel){viewRouter.profile.avaibleFriends.remove(at: index )}
                                Button("No", role: .cancel){}
                            }
                        }
                    }
                }
            }
        }
        .padding()
        Button("Back to menu", action: {viewRouter.currentPage = .menuView})
            .frame(alignment: .topLeading)
            .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
