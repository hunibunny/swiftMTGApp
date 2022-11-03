//
//  ScreenButton.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI



//redo this :)
struct ScreenButton: View {
    @EnvironmentObject var modelData: ModelData
    let rotation: Double
    let topColor: UIColor
    let bottomColor: UIColor
    let idealHeight: CGFloat?
    
    @State var changeOfTopColors: CGFloat = 0
    @State var changeOfBottomColors: CGFloat = 0
    
    @State private var hp: Int
    let middleColor: UIColor
    
    init(rotation: Double, topColor: UIColor, bottomColor: UIColor, idealHeight: CGFloat?, hp: Int){
        self.rotation = rotation
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.hp = hp
        self.middleColor = averageColor(topColor: self.topColor, bottomColor: self.bottomColor)
        self.idealHeight = idealHeight
        
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                VStack(spacing: 0){
                    Rectangle()
                        .fill(.linearGradient(
                            Gradient(colors: [Color(UIColor(red: topColor.components.red+changeOfTopColors, green: topColor.components.green+changeOfTopColors, blue: topColor.components.blue+changeOfTopColors, alpha: 1)),
                                              Color(UIColor(red: middleColor.components.red + changeOfTopColors, green: middleColor.components.green + changeOfTopColors, blue: middleColor.components.blue + changeOfTopColors, alpha: 1))]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ))
                        .border(Color.red)
                        .onTapGesture{
                            hp += 1
                            flashTop()
                        }
                    Rectangle()
                        .fill(.linearGradient(
                            Gradient(colors: [Color(UIColor(red: middleColor.components.red + changeOfBottomColors, green: middleColor.components.green + changeOfBottomColors, blue: middleColor.components.blue + changeOfBottomColors, alpha: 1)),
                                              Color(UIColor(red: bottomColor.components.red + changeOfBottomColors, green: bottomColor.components.green + changeOfBottomColors, blue: bottomColor.components.blue + changeOfBottomColors, alpha: 1))]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ))
                        .border(Color.red)
                        .onTapGesture{
                            hp -= 1
                            flashBottom()
                        }
                }
                Text(String(hp))
                    .foregroundColor(middleColor.components.red+middleColor.components.green+middleColor.components.blue/3 > 0.55 ? Color.black : Color.white)
            }
            
        }
        .rotationEffect(.degrees(rotation))
        
    }
        func flashTop(){
            changeOfTopColors = 0.1
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                changeOfTopColors = 0
            }
        }
        
        func flashBottom(){
            changeOfBottomColors = 0.1
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                changeOfBottomColors = 0
            }
        }
}
    

struct ScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil, hp: 10)
    }
}

