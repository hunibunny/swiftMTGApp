//
//  ViewRouter.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import SwiftUI



class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .menuView
    @Published var numberOfPages = Page.allCases.count
    @Published var allPages = Page.allCases

}


//, LosslessStringConvertible
