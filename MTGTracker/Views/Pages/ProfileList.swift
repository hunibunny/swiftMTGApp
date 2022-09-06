//
//  ProfileList.swift
//  MTGTracker
//
//  Created by Pirita on 30/08/2022.
//

import SwiftUI
import CoreData


struct ProfileList: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    @State var itemNumberToDelete = 0
    @State var profileInspected = ModelData().inspectedProfile
    var body: some View {
        VStack{
            GeometryReader{geometry in
            ScrollView{
                ForEach(0..<modelData.profiles.count, id: \.self){index in
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
                                modelData.viewRouter.currentPage = .profileEdit
                            }
                            .defaultStyling()
                            Button("Delete"){
                                showingAlert = true
                                itemNumberToDelete = index
                            }
                            .defaultStyling()
                        
                            .alert("Delete this friend?", isPresented: $showingAlert){
                                Button("Yes", action:{modelData.profiles.remove(at: itemNumberToDelete)})
                                    .defaultStyling()
                                Button("No", role: .cancel){}
                                    .defaultStyling()
                            }
                        }
                    }.frame(maxHeight: geometry.size.height/10)
                    
                }.frame(minHeight: geometry.size.height)
            }
            }
            .frame(alignment: .center)
            .padding(.leading, nil)
            .padding(.trailing, nil)
            Button("Add a profile", action:{
                let newProfile = Profile(context: moc)
                newProfile.name = "New profile"
                modelData.profiles.append(newProfile);
                modelData.editedProfile = modelData.profiles.last;
                modelData.editingProfile = false
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
