//
//  Data.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 12/5/22.
//

import Foundation
import SwiftUI

extension Data{
    var color : UIColor {
        return try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(self) as! UIColor
    }
}
