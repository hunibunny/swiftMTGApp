//
//  CounterView.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

struct CounterView: View {
    @EnvironmentObject var modelData: ModelData
    @State var height = 0.0
    @State private var showCounterViewMenu = false
    @State var displayDices = false
    var body: some View {
        ZStack{
            if modelData.currentGame!.ammountOfPlayers == 2{
                VStack(spacing: 0){
                    CounterButton(rotation: 180, topColor: modelData.currentGame!.playerArray![0].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![0].bottomDataColor!.color, idealHeight: nil, localHp: nil,  healthPoint: modelData.currentGame?.hpArray![0], inGame: true)
                    CounterButton(rotation: 0, topColor: modelData.currentGame!.playerArray![1].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![1].bottomDataColor!.color, idealHeight: nil, localHp: nil, healthPoint: modelData.currentGame?.hpArray![1], inGame: true)
                }
            }
            else if modelData.currentGame!.ammountOfPlayers == 3{
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        GeometryReader{viewSize in
                            CounterButton(rotation: 90, topColor: modelData.currentGame!.playerArray![0].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![0].bottomDataColor!.color, idealHeight: nil, localHp: nil,  healthPoint: modelData.currentGame?.hpArray![0], inGame: true)
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width/4, y: viewSize.size.height/2)
                            
                            CounterButton(rotation: -90, topColor: modelData.currentGame!.playerArray![1].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![1].bottomDataColor!.color, idealHeight: nil, localHp: nil, healthPoint: modelData.currentGame?.hpArray![1], inGame: true)
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width*3/4, y: viewSize.size.height/2)
                        }
                            
                    }
                    
                    CounterButton(rotation: 0, topColor: modelData.currentGame!.playerArray![2].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![2].bottomDataColor!.color, idealHeight: nil, localHp: nil, healthPoint: modelData.currentGame?.hpArray![2], inGame: true)
                }
            }
            else if modelData.currentGame!.ammountOfPlayers == 4{
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        GeometryReader{viewSize in
                            CounterButton(rotation: 90, topColor: modelData.currentGame!.playerArray![0].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![0].bottomDataColor!.color, idealHeight: nil, localHp: nil, healthPoint: modelData.currentGame?.hpArray![0], inGame: true)
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width/4, y: viewSize.size.height/2)
                        
                            CounterButton(rotation: -90, topColor: modelData.currentGame!.playerArray![1].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![1].bottomDataColor!.color, idealHeight: nil, localHp: nil,  healthPoint: modelData.currentGame?.hpArray![1], inGame: true)
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width*3/4, y: viewSize.size.height/2)
                        }
                    }
                    HStack(spacing: 0){
                        GeometryReader{viewSize in
                            CounterButton(rotation: 90, topColor: modelData.currentGame!.playerArray![2].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![2].bottomDataColor!.color, idealHeight: nil, localHp: nil,  healthPoint: modelData.currentGame?.hpArray![2], inGame: true)
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width/4, y: viewSize.size.height/2)
                        
                            CounterButton(rotation: -90, topColor: modelData.currentGame!.playerArray![3].topDataColor!.color, bottomColor: modelData.currentGame!.playerArray![3].bottomDataColor!.color, idealHeight: nil, localHp: nil, healthPoint: modelData.currentGame?.hpArray![3], inGame: true)
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width*3/4, y: viewSize.size.height/2)
                        }
                    }
                }
            }
            
            if showCounterViewMenu{
                CounterViewMenu()
            }
            
            Button("Menu", action:{showCounterViewMenu = !showCounterViewMenu; modelData.showDices = false}).defaultStyling()
               .frame(alignment: .center)
        }
    }
}
