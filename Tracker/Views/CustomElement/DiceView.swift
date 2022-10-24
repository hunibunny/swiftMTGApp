//
//  DiceView.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

struct DiceView: View {
    @State private var fourFaceDice = 4
    @State private var sixFaceDice = 6
    @State private var eightFaceDice = 8
    @State private var tenFaceDice = 10
    @State private var twelveFaceDice = 12
    @State private var twentyFaceDice = 20
    @State private var round = 0
    @State private var diceShapes = [Triangle(), Rectangle(), Triangle(), Kite(), Pentagon(), Triangle()]
    @State private var diceNumbers = [4, 6, 8, 10, 12, 20]


    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Triangle()
                        .fill(.indigo)
                        .onTapGesture{
                            fourFaceDice = Int.random(in: 1...4)
                        }
                    Text(String(fourFaceDice))
                        .foregroundColor(Color.white)
                }
                ZStack{
                    Rectangle()
                        .fill(.indigo)
                        .onTapGesture {
                            sixFaceDice = Int.random(in: 1...6)
                        }
                    Text(String(sixFaceDice))
                        .foregroundColor(Color.white)
                       
                }
            }
            HStack{
                ZStack{
                    Triangle()
                        .fill(.indigo)
                        .onTapGesture {
                            eightFaceDice = Int.random(in: 1...8)
                        }

                    Text(String(eightFaceDice))
                        .foregroundColor(Color.white)
                                        }
                ZStack{
                    Kite()
                        .fill(.indigo)
                        .onTapGesture {
                            tenFaceDice = Int.random(in: 1...10)
                        }
                    Text(String(tenFaceDice))
                        .foregroundColor(Color.white)
                        
                }
            }
            HStack{
                ZStack{
                    Pentagon()
                        .fill(.indigo)
                        .onTapGesture {
                            twelveFaceDice = Int.random(in: 1...12)
                        }
                    Text(String(twelveFaceDice))
                        .foregroundColor(Color.white)
                        
                }
                ZStack{
                    Triangle()
                        .fill(.indigo)
                        .onTapGesture {
                            twentyFaceDice = Int.random(in: 1...20)
                        }
                    Text(String(twentyFaceDice))
                        .foregroundColor(Color.white)
                        
                }
            }
        }
       
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}


