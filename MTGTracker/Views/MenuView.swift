//
//  MenuView.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import SwiftUI

struct MenuView: View {
    @State var inMenus = true
    
    var body: some View {
        if inMenus{
            Button("Track a Game"){
                inMenus = false
            }
        }
        else{
            TrackerSetUp()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
