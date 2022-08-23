//
//  CustomButton.swift
//  MTGTracker
//
//  Created by Pirita on 22/08/2022.
//

import SwiftUI

extension Button{
    func defaultStyling() -> some View{
        self.background(RoundedRectangle(cornerSize:CGSize(width: 10, height: 10))
            .scale(1.1)
            .fill(.indigo))
        .foregroundColor(.white)
        .padding()
    }
}

