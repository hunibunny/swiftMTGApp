//
//  ViewRouter.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import SwiftUI



struct ViewRouter{
    var currentPage: Page = .menuView
    var numberOfPages = Page.allCases.count
    var allPages = Page.allCases
}
//, LosslessStringConvertible
