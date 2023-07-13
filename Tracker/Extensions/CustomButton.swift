//
//  CustomButton.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

extension Button{
    func defaultStyling(viewSize: CGSize? = nil, paddingAmmount: CGFloat? = nil) -> some View{
        self.frame(width: viewSize == nil ? nil : viewSize!.width/10, height: viewSize == nil ? nil : viewSize!.height/20, alignment: .bottom)
        .background(RoundedRectangle(cornerSize:CGSize(width: 20, height: 20))
            .scale(1.3)
            .fill(Color.blue))
        .dynamicTypeSize(.large)
        .foregroundColor(.white)
        .padding(.all, paddingAmmount)
        
        
        
    }
}
