//
//  ProfileList.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI
import CoreData


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
                            ProfileScrollBlock(profile: profile)
                        
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

