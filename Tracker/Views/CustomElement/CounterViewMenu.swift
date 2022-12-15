//
//  CounterViewMenu.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

struct CounterViewMenu: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State private var chosenRandomStarter = "Choose a random starter"
    var body: some View {
        Rectangle()
            .foregroundColor(Color.black.opacity(0.5))
            .ignoresSafeArea()
        VStack{
            HStack(){
                Button("Go back to menu", action: {saveGame(currentGame: modelData.currentGame!, moc: moc); print(modelData.savedGames.count);modelData.viewRouter.currentPage = .menuView})
                    .defaultStyling()
                    .frame(maxWidth: UIScreen.screenWidth/2, maxHeight: UIScreen.screenHeight/2)
                Button(chosenRandomStarter, action:{chosenRandomStarter =  modelData.currentGame?.playerArray?.randomElement()?.name ?? "No players to choose from"})
                //prefix(modelData.currentGame!.ammountOfPlayers)
                    .defaultStyling()
                    .frame(maxWidth: UIScreen.screenWidth/2, maxHeight: UIScreen.screenHeight/2)
            }
            Circle()
                .opacity(0)
                .frame(width: UIScreen.screenWidth/10, height: UIScreen.screenHeight/10, alignment: .center)
            HStack{
                VStack(spacing: 0){
                    Button("Throw a dice", action:{modelData.showDices = true}).defaultStyling()
                        .frame(maxWidth: UIScreen.screenWidth/2, maxHeight: UIScreen.screenHeight/30)
                    if(modelData.showDices){
                        DiceView()
                            .padding()
                    }
                }
                Button("Automatic save is on", action:{print("save the game"); try! moc.save()}).defaultStyling()
                    .frame(maxWidth: UIScreen.screenWidth/2, maxHeight: UIScreen.screenHeight/2)
            }
        }
    }
}


