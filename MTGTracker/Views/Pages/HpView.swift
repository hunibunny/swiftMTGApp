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

struct HpView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var totalPlayers = 4
    var topColor1 = UIColor.cyan
    var bottomColor1 = UIColor.magenta
    var topColor2 = UIColor.cyan
    var bottomColor2 = UIColor.magenta
    var topColor3 = UIColor.cyan
    var bottomColor3 = UIColor.magenta
    var topColor4 = UIColor.cyan
    var bottomColor4 = UIColor.magenta
    @State private var showHpMenu = false
    
    
    var body: some View {
        ZStack{
            if totalPlayers == 2{
                VStack(spacing: 0){
                    ScreenButton(rotation: 180, topColor: topColor1, bottomColor: bottomColor1, idealHeight: nil)
                    ScreenButton(rotation: 0, topColor: topColor2, bottomColor: bottomColor2, idealHeight: nil)
            
                }
            }
            else if totalPlayers == 3{
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: topColor1, bottomColor: bottomColor1, idealHeight: nil)
                        ScreenButton(rotation: 0, topColor: topColor2, bottomColor: bottomColor2, idealHeight: nil)
                    }
                    .rotationEffect(.degrees(90))
                    .scaleEffect(x: 1.1)
                    ScreenButton(rotation: 0, topColor: topColor3, bottomColor: bottomColor3, idealHeight: nil)
                
                }
            }
            else if totalPlayers == 4{
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: topColor1, bottomColor: bottomColor1, idealHeight: nil)
                        ScreenButton(rotation: 0, topColor: topColor2, bottomColor: bottomColor2, idealHeight: nil)
                    }
                    .rotationEffect(.degrees(90))
                    //.scaleEffect(x: 1.1)

                    VStack(spacing: 0){
                        ScreenButton(rotation: 180, topColor: topColor3, bottomColor: bottomColor3, idealHeight: nil)
                        ScreenButton(rotation: 0, topColor: topColor4, bottomColor: bottomColor4, idealHeight: nil)
                    }
                    .rotationEffect(.degrees(90))
                }
                .scaleEffect(x: 1.1)
            }
            if showHpMenu{
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .ignoresSafeArea()
                VStack{
                    HStack(){
                        Button("Go back to menu", action: {viewRouter.currentPage = .menuView})
                        CustomButton(screenWidth: UIScreen.screenWidth)
                    }
                    HStack{
                        CustomButton(screenWidth: UIScreen.screenWidth)
                        CustomButton(screenWidth: UIScreen.screenWidth)
                    }
                }
            }
            Circle()
                .fill(Color.red)
                .frame(width: UIScreen.screenWidth/10, height: UIScreen.screenHeight/10, alignment: .center)
                .onTapGesture{
                    showHpMenu = !showHpMenu
                }
                .onAppear{
                    print()
                }
        }
        .onAppear(){
            print("displaying hpView")
        }
        if totalPlayers == 5{
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
