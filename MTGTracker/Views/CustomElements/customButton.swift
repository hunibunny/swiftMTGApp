//
//  customButton.swift
//  MTGTracker
//
//  Created by Pirita on 26/07/2022.
//

import SwiftUI

struct CustomButton: View {
    var screenWidth: CGFloat
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.black.opacity(0))
                .border(Color.blue)
            Rectangle()
                .frame(width: UIScreen.screenWidth/10, height: UIScreen.screenWidth/10, alignment: .topLeading)
        }
        .onTapGesture {
            print("Ehe")
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(screenWidth: 100)
    }
}
