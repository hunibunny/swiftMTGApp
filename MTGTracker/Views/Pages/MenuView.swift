//
//  MenuView.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//


import SwiftUI


struct MenuView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    
    var body: some View {
        VStack{
            Button("My Profile", action: {viewRouter.currentPage = .profileView})
            Button("Start a game", action: {viewRouter.currentPage = .trackerSetUp})
        }
        .onAppear(){
            print("displaying MenuView")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
