//
//  DiceView.swift
//  MTGTracker
//
//  Created by Pirita on 08/08/2022.
//

import SwiftUI

struct Triangle : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

struct Kite: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: 3*rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: 3*rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

public struct Pentagon: Shape {
    /// Creates a square bottomed pentagon.
    public init() {}
    
    var insetAmount: CGFloat = 0
    
    public func path(in rect: CGRect) -> Path {
        let insetRect: CGRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        let w = insetRect.width
        let h = insetRect.height

        return Path { path in
            path.move(to:    CGPoint(x: w/2, y:   0))
            path.addLine(to: CGPoint(x:   0, y: h/2))
            path.addLine(to: CGPoint(x:   0, y:   h))
            path.addLine(to: CGPoint(x:   w, y:   h))
            path.addLine(to: CGPoint(x:   w, y: h/2))
            path.closeSubpath()
        }
        .offsetBy(dx: insetAmount, dy: insetAmount)
    }
}

struct DiceView: View {
    @State var fourFaceDice = 4
    @State var sixFaceDice = 6
    @State var eightFaceDice = 8
    @State var tenFaceDice = 10
    @State var twelveFaceDice = 12
    @State var twentyFaceDice = 20
    @State var round = 0
    @State var diceShapes = [Triangle(), Rectangle(), Triangle(), Kite(), Pentagon(), Triangle()]
    @State var diceNumbers = [4, 6, 8, 10, 12, 20]


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


/*
 HStack(spacing: 0){
     Triangle()
         .rotationEffect(.degrees(8.9))
         .frame(alignment: .trailing)
         .border(Color.red)
     Triangle()
         .rotationEffect(.degrees(-8.9))
         .frame(alignment: .leading)
         .border(Color.red)
 }
 

 
 ForEach(1...3, id: \.self){firstIndex in
     HStack{
         ForEach(1...2, id: \.self){secondIndex in
             ZStack{
                 if (round == 1 || round == 3 || round == 6){
                     Triangle()
                 }
                 else if (round == 2){
                     Rectangle()
                 }
                 else if(round == 4){
                     Kite()
                 }
                 else if(round == 5){
                     Pentagon()
                 }
                 if(diceNumbers.count >= round){
                     let valueOfDice = diceNumbers[round]
                     Text(String(valueOfDice))
                         .foregroundColor(Color.white)
                 }
                 
             }
             .onAppear(){
//                         round = round + 1
                 print(round)
             }
         }
     }
 }

 */
