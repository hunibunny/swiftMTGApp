//
//  ScreenButton.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI


/*
func showColor() {
    UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
        self.view.backgroundColor = self.colors.randomElement()
    }, completion: { finished in
       print("another animation! - 1")
       Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showColorAgain), userInfo: nil, repeats: false)
    })
}

@objc func showColorAgain() {
    showColor()
}
 */

//geometry reader here

struct ScreenButton: View {
    @EnvironmentObject var modelData: ModelData
    let rotation: Double
    let topColor: UIColor
    let bottomColor: UIColor
    var idealHeight: CGFloat?
    
    @State private var hp: Int
    var upperMiddleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var lowerMiddleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var middleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    

    init(rotation: Double, topColor: UIColor, bottomColor: UIColor, idealHeight: CGFloat?, hp: Int){
        self.rotation = rotation
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.hp = hp
        self.upperMiddleColor = averageColor(topColor: self.topColor, bottomColor: self.bottomColor)
        self.lowerMiddleColor = averageColor(topColor: self.topColor, bottomColor: self.bottomColor)
        self.middleColor = averageColor(topColor: self.topColor, bottomColor: self.bottomColor)
        self.idealHeight = idealHeight
        
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                VStack(spacing: 0){
                    Rectangle()
                        .fill(.linearGradient(
                            Gradient(colors: [Color(topColor), Color(upperMiddleColor)]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ))
                        //.frame(maxHeight: idealHeight)
                        .border(Color.red)
                        .onTapGesture{
                            hp += 1
                            //topColor = topColor
                            
                            print("hehe")
                            }
                            
                        }
                    Rectangle()
                        .fill(.linearGradient(
                            Gradient(colors: [Color(lowerMiddleColor), Color(bottomColor)]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ))
                        //.frame(maxHeight: idealHeight)
                        .border(Color.red)
                        .onTapGesture{
                            hp -= 1
                        }
                }
            Text(String(hp))
                    .foregroundColor(middleColor.components.red+middleColor.components.green+middleColor.components.blue/3 > 0.55 ? Color.black : Color.white)
        }
        .rotationEffect(.degrees(rotation))
        }

    
    func averageColor(topColor: UIColor, bottomColor: UIColor)->UIColor{
        let averageRed = (topColor.components.red + bottomColor.components.red)/2
        let averageGreen = (topColor.components.green + bottomColor.components.green)/2
        let averageBlue = (topColor.components.blue + bottomColor.components.blue)/2
        let averageAlpha = (topColor.components.alpha + bottomColor.components.alpha)/2
        let averageColor = UIColor(red: averageRed, green: averageGreen, blue: averageBlue, alpha: averageAlpha)
        return averageColor
    }
}

struct ScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil, hp: 10)
    }
}

