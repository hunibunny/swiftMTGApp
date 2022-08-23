//
//  hpView.swift
//  MTGTracker
//
//  Created by Pirita on 08/07/2022.
//
import SwiftUI



struct HpView: View {
    @EnvironmentObject var modelData: ModelData
  //  var totalPlayers = 4
    var topColor1 = UIColor.cyan
    var bottomColor1 = UIColor.magenta
    var topColor2 = UIColor.cyan
    var bottomColor2 = UIColor.magenta
    var topColor3 = UIColor.cyan
    var bottomColor3 = UIColor.magenta
    var topColor4 = UIColor.cyan
    var bottomColor4 = UIColor.magenta
    @State private var showHpMenu = false
    @State var chosenRandomStarter = "Choose a random starter"
    @State var displayDices = false
    var body: some View {
        ZStack{
            if modelData.gameSettings.ammountOfPlayers == 2{
                VStack(spacing: 0){
                    ScreenButton(rotation: 180, topColor: modelData.gameSettings.players[0].topColor , bottomColor: modelData.gameSettings.players[0].bottomColor, idealHeight: nil)
                        
                       
                    ScreenButton(rotation: 0, topColor: modelData.gameSettings.players[1].topColor, bottomColor: modelData.gameSettings.players[1].bottomColor, idealHeight: nil)
            
                }
                .ignoresSafeArea()
            }
            else if modelData.gameSettings.ammountOfPlayers == 3{
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: modelData.gameSettings.players[0].topColor, bottomColor: modelData.gameSettings.players[0].bottomColor, idealHeight: nil)
                        ScreenButton(rotation: 0, topColor: modelData.gameSettings.players[1].topColor, bottomColor: modelData.gameSettings.players[1].bottomColor, idealHeight: nil)
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.2)
                    ScreenButton(rotation: 0, topColor: modelData.gameSettings.players[2].topColor, bottomColor: modelData.gameSettings.players[2].bottomColor, idealHeight: nil)
                
                }
            }
            else if modelData.gameSettings.ammountOfPlayers == 4{
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: modelData.gameSettings.players[0].topColor, bottomColor: modelData.gameSettings.players[0].bottomColor, idealHeight: nil)
                        ScreenButton(rotation: 0, topColor: modelData.gameSettings.players[1].topColor, bottomColor: modelData.gameSettings.players[1].bottomColor, idealHeight: nil)
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.1)

                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: modelData.gameSettings.players[2].topColor, bottomColor: modelData.gameSettings.players[2].bottomColor, idealHeight: nil)
                        ScreenButton(rotation: 0, topColor: modelData.gameSettings.players[3].topColor, bottomColor: modelData.gameSettings.players[3].topColor, idealHeight: nil)
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.1)
                }
                .scaleEffect(x: 1.1)
                .frame(alignment: .center)
                
            }
            
            if showHpMenu{
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .ignoresSafeArea()
                VStack{
                    HStack(){
                        Button("Go back to menu", action: {modelData.viewRouter.currentPage = .menuView}).defaultStyling()
                        Button(chosenRandomStarter, action:{chosenRandomStarter =  modelData.profile.chosenFriends.randomElement()?.username ?? "No players to choose from"}).defaultStyling()
                    }
                    HStack{
                        VStack{
                            Button("Throw a dice", action:{displayDices = true}).defaultStyling()
                            if(displayDices){
                                DiceView()
                            }
                        }
                        Button("Save the game", action:{print("save the game")}).defaultStyling()
                    }
                }
            }
            Circle()
                .fill(Color.red)
                .frame(width: UIScreen.screenWidth/10, height: UIScreen.screenHeight/10, alignment: .center)
                .onTapGesture{
                    showHpMenu = !showHpMenu
                }
        }
        .onAppear(){
            print("displaying hpView")
        }
        if modelData.gameSettings.ammountOfPlayers == 5{
            VStack(spacing: 0){
                VStack{
                    HStack{
                        ScreenButton(rotation: 90, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                        ScreenButton(rotation: 270, topColor: UIColor.green, bottomColor: UIColor.black, idealHeight: nil)
                    //.rotationEffect(.degrees(90))
                    }
                    scaledToFill()
                    HStack{
                        ScreenButton(rotation: 90, topColor: UIColor.blue, bottomColor: UIColor.black, idealHeight: nil)
                        ScreenButton(rotation: 270, topColor: UIColor.red, bottomColor: UIColor.black, idealHeight: nil)
                    }
                    scaledToFill()
                    //.rotationEffect(.degrees(90))
                }
                ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: UIScreen.screenHeight/6)
            }
            //.scaleEffect(x: 1.1)
            
        }
    }
}

struct HpView_Previews: PreviewProvider {
    static var previews: some View {
        HpView()
    }
}
