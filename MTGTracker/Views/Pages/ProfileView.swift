//
//  ProfileView.swift
//  MTGTracker
//
//  Created by Pirita on 01/08/2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Text(viewRouter.profile.username)
        HStack{
            Image("capybara")
                .resizable()
                .frame(maxHeight: 200)
            ScreenButton(rotation: 0, topColor: UIColor.magenta, bottomColor: UIColor.cyan, idealHeight: nil)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
