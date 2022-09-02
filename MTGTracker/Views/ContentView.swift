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
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var modelData: ModelData
    @FetchRequest(sortDescriptors: []) var profiles: FetchedResults<Profile>
    
    var body: some View {
        switch modelData.viewRouter.currentPage{
        case .menuView:
            MenuView()
        case .trackerSetUp:
            TrackerSetUp()
        case .hpView:
            HpView()
        case .profileEdit:
            ProfileEdit(chosenTopColor: convertUIColor(uiColor: (modelData.editedProfile!.topColor)), chosenBottomColor: convertUIColor(uiColor: (modelData.editedProfile!.bottomColor)), editedProfile: modelData.editedProfile!, editingProfile: modelData.editingProfile)
        case .profileList:
            ProfileList()
        case .gameList:
            GameList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
        
    }
}
