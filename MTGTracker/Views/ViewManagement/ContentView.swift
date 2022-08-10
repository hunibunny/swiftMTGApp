//
//  ContentView.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    //@EnvironmentObject var state: NavigationStack
    //@StateObject var state = NavigationStack()
    var body: some View {
        switch viewRouter.currentPage{
        case .menuView:
            MenuView()
        case .trackerSetUp:
            TrackerSetUp()
        case .hpView:
            HpView()
        case .profileView:
            ProfileView()
        case .friendList:
            FriendList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
        
    }
}
