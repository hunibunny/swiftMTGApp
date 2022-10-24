//
//  CustomButton.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

extension Button{
    func defaultStyling(paddingAmmount: CGFloat? = nil) -> some View{
        self.background(RoundedRectangle(cornerSize:CGSize(width: 10, height: 10))
            .scale(1.1)
            .fill(.indigo))
        .foregroundColor(.white)
        .padding(.all, paddingAmmount)
        
    }
}
