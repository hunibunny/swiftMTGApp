//
//  ViewController.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

import Foundation

enum Page: CaseIterable{
    case menuView
    case trackerSetUp
    case counterView
    case profileEdit
    case profileList
    case gameList
}

struct ViewRouter{
    var currentPage: Page = .menuView
    var numberOfPages = Page.allCases.count
    var allPages = Page.allCases
}
