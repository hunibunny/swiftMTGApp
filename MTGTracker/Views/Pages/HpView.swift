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
    @State var height = 0.0
    @State private var showHpMenu = false
    @State var displayDices = false
    var body: some View {
        GeometryReader{outsideBox in
        ZStack{
            if modelData.currentGame!.ammountOfPlayers == 2{
                VStack(spacing: 0){
                    GeometryReader{geometry in
                        ScreenButton(rotation: 180, topColor: modelData.currentGame!.players[0].topColor , bottomColor: modelData.currentGame!.players[0].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[0])
                            .onAppear{
                                height = geometry.size.width
                            }
                    }
                       
                    ScreenButton(rotation: 0, topColor: modelData.currentGame!.players[1].topColor, bottomColor: modelData.currentGame!.players[1].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[1])
            
                }
                .frame(alignment: .center)
                //.ignoresSafeArea()
            }
            else if modelData.currentGame!.ammountOfPlayers == 3{
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        GeometryReader{geometry in
                            ScreenButton(rotation: 180, topColor: modelData.currentGame!.players[0].topColor, bottomColor: modelData.currentGame!.players[0].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[0])
                                .onAppear{
                                    height = geometry.size.width
                                }
                        }
                        ScreenButton(rotation: 0, topColor: modelData.currentGame!.players[1].topColor, bottomColor: modelData.currentGame!.players[1].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[1])
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.2)
                    ScreenButton(rotation: 0, topColor: modelData.currentGame!.players[2].topColor, bottomColor: modelData.currentGame!.players[2].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[2])
                
                }
                .frame(alignment: .center)
            }
            else if modelData.currentGame!.ammountOfPlayers == 4{
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        GeometryReader{geometry in
                            ScreenButton(rotation: 180, topColor: modelData.currentGame!.players[0].topColor, bottomColor: modelData.currentGame!.players[0].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[0])
                                .onAppear{
                                    height = geometry.size.width
                                }
                        }
                        
                        
                        ScreenButton(rotation: 0, topColor: modelData.currentGame!.players[1].topColor, bottomColor: modelData.currentGame!.players[1].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[1])
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.1)


                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: modelData.currentGame!.players[2].topColor, bottomColor: modelData.currentGame!.players[2].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[2])
                        ScreenButton(rotation: 0, topColor: modelData.currentGame!.players[3].topColor, bottomColor: modelData.currentGame!.players[3].bottomColor, idealHeight: nil, hp: modelData.currentGame!.hp[3])
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.1)
                }
                .frame(alignment: .center)
               // .scaleEffect(x: 1.1)
               // .offset(y: height > UIScreen.screenHeight/2 ? height-UIScreen.screenHeight/2-UIScreen.screenHeight/40 :  UIScreen.screenHeight/2-UIScreen.screenHeight/40-height)
                
            }
            if showHpMenu{
                HpMenu()
            }
            Button("Menu", action:{showHpMenu = !showHpMenu; modelData.showDices = false}).defaultStyling()
            //   .fill(Color.red)
               .frame(alignment: .center)
               .border(Color(.red))

        }
        }
        .onAppear(){
            print("displaying hpView")
        }
    }
}

struct HpView_Previews: PreviewProvider {
    static var previews: some View {
        HpView()
    }
}
