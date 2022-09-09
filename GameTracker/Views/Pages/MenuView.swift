//
//  MenuView.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//


import SwiftUI


struct MenuView: View {
    @EnvironmentObject var modelData: ModelData //viewrouter only needed
    var body: some View {
        VStack{
            Button("Start a game", action: {modelData.currentGame = GameData(name: "New Game"); modelData.viewRouter.currentPage = .trackerSetUp})
                .defaultStyling()
            Button("Profiles"){
                //modelData.inspectedProfile = modelData.profile
                modelData.viewRouter.currentPage = .profileList
            }
            .defaultStyling()
            Button("Saved games", action:{modelData.viewRouter.currentPage = .gameList}).defaultStyling()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
