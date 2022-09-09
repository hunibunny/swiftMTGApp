//
//  ContentView.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI
import CoreData

func convertUIColor (uiColor: UIColor) -> Color {
    return Color(red: Double(uiColor.cgColor.components![0]), green: Double(uiColor.cgColor.components![1]), blue: Double(uiColor.cgColor.components![2]))
}

struct Testing{
    var id = UUID().uuidString
    var name: String
}



struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @FetchRequest(sortDescriptors: []) var fetchedProfiles: FetchedResults<Profile>
    //let persistenceController = PersistenceController.shared
    
    var body: some View {
        switch modelData.viewRouter.currentPage{
        case .menuView:
            MenuView()
        case .trackerSetUp:
            TrackerSetUp()
                //.environment(\.managedObjectContext, moc)
        case .hpView:
            HpView()
        case .profileEdit:
            ProfileEdit(chosenTopColor: convertUIColor(uiColor: (modelData.editedProfile!.topColor)), chosenBottomColor: convertUIColor(uiColor: (modelData.editedProfile!.bottomColor)), editedProfile: modelData.editedProfile!, editingProfile: modelData.editingProfile)
                //.environment(\.managedObjectContext, moc)
        case .profileList:
            ProfileList()
                //.onAppear{
              //      modelData.profiles = Array(fetchedProfiles)
              //  }
                //.environment(\.managedObjectContext, moc)
        case .gameList:
            GameList()
        }
    }
    //init(){
      //  _fetchedProfiles = FetchRequest<Profile>(sortDescriptors: [])
    //}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
        
    }
}
