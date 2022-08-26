//
//  HpMenu.swift
//  MTGTracker
//
//  Created by Pirita on 23/08/2022.
//

import SwiftUI

struct HpMenu: View {
    @EnvironmentObject var modelData: ModelData
    @State var chosenRandomStarter = "Choose a random starter"
   // var listToRandomiceFrom = ModelData().currentGame.players
    var body: some View {
        Rectangle()
            .foregroundColor(Color.black.opacity(0.5))
            .ignoresSafeArea()
        VStack{
            HStack(){
                Button("Go back to menu", action: {modelData.viewRouter.currentPage = .menuView})
                    .defaultStyling()
                    .frame(maxWidth: UIScreen.screenWidth/2, maxHeight: UIScreen.screenHeight/2)
                Button(chosenRandomStarter, action:{chosenRandomStarter =  modelData.currentGame!.players.prefix(modelData.currentGame!.ammountOfPlayers).randomElement()?.username ?? "No players to choose from"})
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
                Button("Save the game", action:{print("save the game")}).defaultStyling()
                    .frame(maxWidth: UIScreen.screenWidth/2, maxHeight: UIScreen.screenHeight/2)
            }
        }
        .onAppear{
            print(modelData.currentGame!.players[3].username)
        }
    }
}

struct HpMenu_Previews: PreviewProvider {
    static var previews: some View {
        HpMenu()
    }
}
