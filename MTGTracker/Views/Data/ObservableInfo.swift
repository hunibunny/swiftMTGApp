//
//  ObservableInfo.swift
//  MTGTracker
//
//  Created by Pirita on 09/08/2022.
//

import SwiftUI

class ObservableInfo: ObservableObject{
    @Published var profile = Profile(username: "Bebu")
    @Published var viewRouter = ViewRouter()
}
