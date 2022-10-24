//
//  MenuView.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI


struct MenuView: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        VStack{
            Button("Start a game", action: { modelData.viewRouter.currentPage = .trackerSetUp})
            //modelData.currentGame = Game(name: "New Game", moc: moc);
                .defaultStyling()
            Button("Profiles"){
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
