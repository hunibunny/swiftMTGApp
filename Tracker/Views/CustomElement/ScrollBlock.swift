//
//  ScrollBlock.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 12/22/22.
//

import Foundation
import SwiftUI

struct ScrollBlock: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var profile: Profile
    @State var showingAlert = false
    @State var displaySelf = true
    @State var displayingProfiles: Bool
    
    init(profile: Profile, displayingProfiles: Bool) {
        self.profile = profile
        self.displayingProfiles = displayingProfiles
    }
    
    var body: some View{
        if displaySelf{
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                HStack{
                    Text(self.profile.name ?? "no name found").padding()
                    Spacer()
                    Button("Edit"){
                        modelData.editedProfile = self.profile
                        modelData.editingProfile = true
                        modelData.viewRouter.currentPage = .profileEdit
                    }
                    .defaultStyling()
                    Button("Delete"){
                        showingAlert = true
                        
                    }
                    .defaultStyling()
                    .alert(self.profile.hpInGame!.count > 0  ? "This profile is part of some game(s), and they will be deleted, are you sure to delete?" : "Are you sure to delete this profile?", isPresented: $showingAlert){
                        Button("Yes", action:{
                            displaySelf = false;
                            moc.delete(profile); try! moc.save();modelData.profiles = loadProfileData(moc: moc); modelData.savedGames = loadGameData(moc: moc)
                            
                        })
                        .defaultStyling()
                        Button("No", role: .cancel){}
                            .defaultStyling()
                    }
                }
            }.frame(minHeight: UIScreen.screenHeight/10, maxHeight: UIScreen.screenHeight/10)
        }
    }
}
