//
//  ColorConvertion.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import Foundation
import SwiftUI

public func convertUIColor (uiColor: UIColor) -> Color {
    return Color(red: Double(uiColor.cgColor.components![0]), green: Double(uiColor.cgColor.components![1]), blue: Double(uiColor.cgColor.components![2]))
}


func averageColor(topColor: UIColor, bottomColor: UIColor) -> UIColor{
    let averageRed = (topColor.components.red + bottomColor.components.red)/2
    let averageGreen = (topColor.components.green + bottomColor.components.green)/2
    let averageBlue = (topColor.components.blue + bottomColor.components.blue)/2
    let averageAlpha = (topColor.components.alpha + bottomColor.components.alpha)/2
    let averageColor = UIColor(red: averageRed, green: averageGreen, blue: averageBlue, alpha: averageAlpha)
    return averageColor
}
