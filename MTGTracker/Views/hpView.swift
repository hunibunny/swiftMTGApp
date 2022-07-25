//
//  hpView.swift
//  MTGTracker
//
//  Created by Pirita on 08/07/2022.
//
import SwiftUI


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}







struct hpView: View {
    var totalPlayers = 4

    var body: some View {
        if totalPlayers == 2{
            VStack(spacing: 0){
                ScreenButton(rotation: 180, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
            }
        }
        else if totalPlayers == 3{
            VStack(spacing: 0){
                VStack(spacing: 0){
                    ScreenButton(rotation: 180, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                    ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                }
                .rotationEffect(.degrees(90))
                .scaleEffect(x: 1.1)
                ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                
            }
        }
        else if totalPlayers == 4{
            VStack(spacing: 0){
                VStack(spacing: 0){
                    ScreenButton(rotation: 180, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                    ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                }
                .rotationEffect(.degrees(90))

                VStack(spacing: 0){
                    ScreenButton(rotation: 180, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                    ScreenButton(rotation: 0, topColor: UIColor.yellow, bottomColor: UIColor.black, idealHeight: nil)
                }
                .rotationEffect(.degrees(90))
            }
            .scaleEffect(x: 1.1)
        }
        else if totalPlayers == 5{
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

struct hpView_Previews: PreviewProvider {
    static var previews: some View {
        hpView()
    }
}
