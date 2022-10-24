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
                    ScreenButton(rotation: 180, topColor: modelData.currentGame!.playerArray![0].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![0].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![0].hp))
                    ScreenButton(rotation: 0, topColor: modelData.currentGame!.playerArray![1].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![1].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![1].hp))
                }
            }
            else if modelData.currentGame!.ammountOfPlayers == 3{
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        GeometryReader{viewSize in
                            ScreenButton(rotation: 90, topColor: modelData.currentGame!.playerArray![0].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![0].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![0].hp))
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width/4, y: viewSize.size.height/2)
                            
                            ScreenButton(rotation: -90, topColor: modelData.currentGame!.playerArray![1].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![1].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![1].hp))
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width*3/4, y: viewSize.size.height/2)
                        }
                            
                    }
                    
                    ScreenButton(rotation: 0, topColor: modelData.currentGame!.playerArray![2].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![2].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![2].hp))
                }
            }
            else if modelData.currentGame!.ammountOfPlayers == 4{
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        GeometryReader{viewSize in
                            ScreenButton(rotation: 90, topColor: modelData.currentGame!.playerArray![0].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![0].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![0].hp))
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width/4, y: viewSize.size.height/2)
                        
                            ScreenButton(rotation: -90, topColor: modelData.currentGame!.playerArray![1].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![1].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![1].hp))
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width*3/4, y: viewSize.size.height/2)
                        }
                    }
                    HStack(spacing: 0){
                        GeometryReader{viewSize in
                            ScreenButton(rotation: 90, topColor: modelData.currentGame!.playerArray![2].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![2].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![2].hp))
                                .frame(width: viewSize.size.height ,height: viewSize.size.width/2)
                                .position(x: viewSize.size.width/4, y: viewSize.size.height/2)
                        
                            ScreenButton(rotation: -90, topColor: modelData.currentGame!.playerArray![3].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![3].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.hpArray![3].hp))
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
               .border(Color(.red))
        }
    }
}

/*struct CounterView: View {
 @EnvironmentObject var modelData: ModelData
 @State var height = 0.0
 @State private var showCounterViewMenu = false
 @State var displayDices = false
 var body: some View {
     GeometryReader{outsideBox in
     ZStack{
         if modelData.currentGame!.ammountOfPlayers == 2{
             VStack(spacing: 0){
                 GeometryReader{geometry in
                     ScreenButton(rotation: 180, topColor: modelData.currentGame!.playerArray![0].topColor as! UIColor , bottomColor: modelData.currentGame!.playerArray?[0].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![0].hp))
                         .onAppear{
                             height = geometry.size.width
                         }
                 }
                    
                 ScreenButton(rotation: 0, topColor: modelData.currentGame!.playerArray![1].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray?[1].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![1].hp))
         
             }
             .frame(alignment: .center)
         }
         else if modelData.currentGame!.ammountOfPlayers == 3{
             VStack(spacing: 0){
                 VStack(spacing: 0){
                     GeometryReader{geometry in
                         ScreenButton(rotation: 180, topColor: modelData.currentGame!.playerArray?[1].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![0].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![0].hp))
                             .onAppear{
                                 height = geometry.size.width
                             }
                     }
                     ScreenButton(rotation: 0, topColor: UIColor(modelData.currentGame!.playerArray![1].returnTopColor()), bottomColor: modelData.currentGame!.playerArray![1].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![1].hp))
                 }
                 .onAppear{
                     print("count")
                     print(modelData.currentGame!.playerArray.count)
                 }
                 .rotationEffect(.degrees(90))
                 .scaleEffect(x: 1.2)
                 ScreenButton(rotation: 0, topColor: modelData.currentGame!.playerArray![2].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![2].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![2].hp))
             
             }
             .frame(alignment: .center)
         }
         else if modelData.currentGame!.ammountOfPlayers == 4{
             VStack(spacing: 0){
                 VStack(spacing: 0){
                     GeometryReader{geometry in
                         ScreenButton(rotation: 180, topColor: modelData.currentGame!.playerArray![0].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![0].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![0].hp))
                             .onAppear{
                                 height = geometry.size.width
                             }
                     }
                     
                     
                     ScreenButton(rotation: 0, topColor: modelData.currentGame!.playerArray![1].topColor as? UIColor ?? UIColor.red, bottomColor: modelData.currentGame!.playerArray?[1].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![1].hp))
                 }
                 .rotationEffect(.degrees(90))
                 .scaleEffect(x: 1.1)
                 VStack(spacing: 0){
                     ScreenButton(rotation: 180, topColor: modelData.currentGame!.playerArray![2].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![2].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![2].hp))
                     ScreenButton(rotation: 0, topColor: modelData.currentGame!.playerArray![3].topColor as! UIColor, bottomColor: modelData.currentGame!.playerArray![3].bottomColor as! UIColor, idealHeight: nil, hp: Int(modelData.currentGame!.playerArray![3].hp))
                 }
                 .rotationEffect(.degrees(90))
                 .scaleEffect(x: 1.1)
             }
             .frame(alignment: .center)
         }
         if showCounterViewMenu{
             CounterViewMenu()
         }
         Button("Menu", action:{showCounterViewMenu = !showCounterViewMenu; modelData.showDices = false}).defaultStyling()
            .frame(alignment: .center)
            .border(Color(.red))

     }
     }
 }
}
*/
