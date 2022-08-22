//
//  CustomButton.swift
//  MTGTracker
//
//  Created by Pirita on 22/08/2022.
//

import SwiftUI
import Foundation

enum ButtonRole: CaseIterable{
    case backToMenu
    case pickRandomPlayer
    case saveGame
}

struct CustomButton: View {
    @EnvironmentObject var modelData: ModelData
    @State var buttonTitle = "deafaultButton"
    var role: ButtonRole = .pickRandomPlayer
    var body: some View {
        Button(buttonTitle, action: {
            print("mlemle")
            switch role{
            case .backToMenu:
                modelData.viewRouter.currentPage = .menuView;
            case .pickRandomPlayer:
                print("picking random player")
            case .saveGame:
                print("wants to save the game")
            default:
                print("default button pressed")
            }
            
        })
            .background(RoundedRectangle(cornerSize:CGSize(width: 10, height: 10))
                .scale(1.1)
                .fill(.indigo))
            .foregroundColor(.white)
            .padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
