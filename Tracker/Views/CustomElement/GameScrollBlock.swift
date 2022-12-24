//
//  GameScrollBlock.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 12/24/22.
//

import SwiftUI



struct GameScrollBlock: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var game: Game
    @State var showingAlert = false
    @State var displaySelf = true
    
    init(game: Game) {
        self.game = game
    }
    
    var body: some View{
        if displaySelf{
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                HStack{
                    Text(self.game.gameName ?? "no name found").padding()
                    Spacer()
                    Button("Continue"){
                        modelData.currentGame = game
                        modelData.viewRouter.currentPage = .counterView
                    }
                    .defaultStyling()
                    Button("Delete"){
                        showingAlert = true
                    }
                    .defaultStyling()
                    .alert("Do you want to delete this game?", isPresented: $showingAlert){
                        Button("Yes", action:{
                            displaySelf = false;
                            moc.delete(game); try! moc.save();modelData.profiles = loadProfileData(moc: moc); modelData.savedGames = loadGameData(moc: moc)
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

