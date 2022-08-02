//
//  RouterHelper.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import Foundation

enum Page: CaseIterable{
    case menuView
    case trackerSetUp
    case hpView
    case profileView
    case friendList
}

let numberOfPages = Page.allCases.count
let allPages = Page.allCases
