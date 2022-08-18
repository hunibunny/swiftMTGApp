//
//  ContentView.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    //@EnvironmentObject var state: NavigationStack
    //@StateObject var state = NavigationStack()
    var body: some View {
        switch modelData.viewRouter.currentPage{
        case .menuView:
            MenuView()
        case .trackerSetUp:
            TrackerSetUp()
        case .hpView:
            HpView()
        case .profileView:
            ProfileView(profileInspected: modelData.inspectedProfile ?? modelData.profile)
        case .friendList:
            FriendList()
        case .addAFriend:
            AddAFriend()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
        
    }
}
