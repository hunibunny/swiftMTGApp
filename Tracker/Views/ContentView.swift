//
//  ContentView.swift
//  tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//


import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        switch modelData.viewRouter.currentPage{
        case .menuView:
            MenuView()
        case .trackerSetUp:
            TrackerSetUp()
            .onAppear{
                modelData.profiles = loadProfileData(moc: moc)
                modelData.avaiablePlayers = modelData.profiles
            }
        case .counterView:
            CounterView()
        case .profileEdit:
            ProfileEdit(
                chosenTopColor: modelData.editingProfile ? convertUIColor(uiColor:(modelData.editedProfile?.topDataColor!.color)!) : convertUIColor(uiColor: UIColor.random),
                chosenBottomColor: modelData.editingProfile ? convertUIColor(uiColor:(modelData.editedProfile?.bottomDataColor!.color)!) : convertUIColor(uiColor: UIColor.random),
                name: modelData.editingProfile ? modelData.editedProfile!.name : nil,
                editedProfile: modelData.editedProfile,
                editingProfile: modelData.editingProfile)
        case .profileList:            
            ProfileList()
                .onAppear{
                    modelData.profiles = loadProfileData(moc: moc)
                    modelData.profiles.sort{
                        $0.name?.localizedStandardCompare($1.name ?? "Unnamed Profile") == .orderedAscending;
                    }
                }
        case .gameList:
            GameList()
                .onAppear{
                    modelData.savedGames = loadGameData(moc: moc)
                    modelData.savedGames.sort{
                        $0.gameName?.localizedStandardCompare($1.gameName ?? "Unnamed Game") == .orderedAscending;
                    }
                }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
        
    }
}
