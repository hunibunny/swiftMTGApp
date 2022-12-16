//
//  ProfileList.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI
import CoreData

//geometry reader here too
//could do so that make new profile when making new here instead of in the other one so not so much difference between editing and creating but it's not super important
struct ProfileList: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    @State var itemNumberToDelete = 0
    @State var itemToDelete: Profile? = nil
    @State var gamesOfDeletedProfile = []
    var body: some View {
        VStack{
            GeometryReader{geometry in
            ScrollView{
                ForEach(modelData.profiles, id: \.self){profile in
                    if(profile.alwaysPermament){
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                            HStack{
                                Text(profile.name ?? "no name found").padding()
                                Spacer()
                                Button("Edit"){
                                    modelData.editedProfile = profile
                                    modelData.editingProfile = true
                                    modelData.viewRouter.currentPage = .profileEdit
                                }
                                .defaultStyling()
                                Button("Delete"){
                                    showingAlert = true
                                
                                }
                                .defaultStyling()
                                .alert(profile.hpOf!.count > 0  ? "This profile is part of some game(s), and they will be deleted, are you sure to delete?" : "Are you sure to delete this profile?", isPresented: $showingAlert){
                                    Button("Yes", action:{
                                        moc.delete(profile);try! moc.save();modelData.profiles = loadProfileData(moc: moc)})
                                        .defaultStyling()
                                    Button("No", role: .cancel){}
                                        .defaultStyling()
                                }
                            }
                        }.frame(maxHeight: geometry.size.height/10)
                    }
                }.frame(minHeight: geometry.size.height)
            }
            }
            .frame(alignment: .center)
            .padding(.leading, nil)
            .padding(.trailing, nil)
            Button("Add a profile", action:{
                modelData.editingProfile = true
                modelData.editedProfile = createNewProfile(name: nil, moc: moc)
                modelData.viewRouter.currentPage = .profileEdit})
                    .defaultStyling(paddingAmmount: 0)
            Button("Back", action:{modelData.viewRouter.currentPage = .menuView}).defaultStyling()
        }
    }
}

struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList()
    }
}

