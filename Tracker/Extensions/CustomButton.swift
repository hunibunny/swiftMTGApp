//
//  CustomButton.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

extension Button{
    func defaultStyling(paddingAmmount: CGFloat? = nil) -> some View{
        self.background(RoundedRectangle(cornerSize:CGSize(width: 20, height: 20))
            .scale(1.3)
            .fill(Color.blue))
        .dynamicTypeSize(.large)
        .foregroundColor(.white)
        .padding(.all, paddingAmmount)
        //.padding(.leading, leadingPaddingAmmount)
        //.padding(.trailing, trailingPaddingAmmount)
        
        
        
        // RoundedRectangle(cornerSize: CGSize(width:20, height:20))
       // .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
        
    }
}
