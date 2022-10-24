//
//  ContentView.swift
//  tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//


import SwiftUI
import CoreData

//muista poistaa quests aaaaaa
//koska ne tallentuu varmaan
//tai ainakin kokeilla :D

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    //@FetchRequest(sortDescriptors: []) var fetchedProfiles: FetchedResults<Profile>
    //let persistenceController = PersistenceController.shared
    //@State var fetchedProfiles = FetchRequest<Profile>(fetchRequest: NSFetchRequest(entityName: "Profile"))
    var body: some View {
        switch modelData.viewRouter.currentPage{
        case .menuView:
            MenuView()
        case .trackerSetUp:
            TrackerSetUp()
            .onAppear{
                modelData.profiles = loadProfileData(moc: moc)
                
            }
             
                //.environment(\.managedObjectContext, moc)
        case .counterView:
            CounterView()
        case .profileEdit:
            ProfileEdit(chosenTopColor: convertUIColor(uiColor: UIColor.random), chosenBottomColor: convertUIColor(uiColor: UIColor.random), name: modelData.nameOfEditedProfile,editedProfile: modelData.editedProfile, editingProfile: modelData.editingProfile)
                //.environment(\.managedObjectContext, moc)
        case .profileList:
            ProfileList()
                .onAppear{
                    modelData.profiles = loadProfileData(moc: moc)
                }
        case .gameList:
            GameList()
                .onAppear{
                    modelData.savedGames = loadGameData(moc: moc)
                }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
        
    }
}
