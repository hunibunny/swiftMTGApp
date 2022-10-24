//
//  ProfileList.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI
import CoreData

//geometry reader here too

struct ProfileList: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    @State var itemNumberToDelete = 0
    @State var profileInspected = ModelData().inspectedProfile
    @State var itemToDelete: Profile? = nil
    var body: some View {
        VStack{
            GeometryReader{geometry in
            ScrollView{
                ForEach(0..<modelData.profiles.count, id: \.self){index in
                    if(modelData.profiles[index].permament){
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                            HStack{
                                Text(modelData.profiles[index].name ?? "no name found").padding()
                                Spacer()
                                Button("Edit"){
                                    modelData.inspectedProfile = modelData.profiles[index]
                                    profileInspected = modelData.profiles[index]
                                    modelData.editedProfile = modelData.profiles[index]
                                    modelData.editingProfile = true
                                    modelData.nameOfEditedProfile = modelData.editedProfile!.name
                                    modelData.viewRouter.currentPage = .profileEdit
                                }
                                .defaultStyling()
                                Button("Delete"){
                                    showingAlert = true
                                    itemNumberToDelete = index
                                    itemToDelete = modelData.profiles[itemNumberToDelete]
                                }
                                .defaultStyling()
                                .alert("Delete this friend?", isPresented: $showingAlert){
                                    Button("Yes", action:{moc.delete(itemToDelete!);try! moc.save();modelData.profiles.remove(at: itemNumberToDelete)})
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
                //let newProfile = createNewProfile(name: "New Profile", moc: moc, isSaved: false)
                //modelData.editedProfile = newProfile
                modelData.editingProfile = false
                modelData.nameOfEditedProfile = nil
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

