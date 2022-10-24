//
//  ColorExtensions.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

extension UIColor{
    var coreImageColor: CIColor{
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            let coreImageColor = self.coreImageColor
            return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }

    static var random: UIColor {
        print(UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        ))
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}
