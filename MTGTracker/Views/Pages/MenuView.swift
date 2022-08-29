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
            Button("Profiles"){
                modelData.inspectedProfile = modelData.profile
                modelData.viewRouter.currentPage = .profileView
            }
            .defaultStyling()
            Button("Start a game", action: {modelData.currentGame = GameData(name: "New Game"); print(modelData.inspectedProfile ?? "mle no value"); modelData.inspectingSelf = true; modelData.viewRouter.currentPage = .trackerSetUp})
                .defaultStyling()
        }
        .onAppear(){
            print("displaying MenuView")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
