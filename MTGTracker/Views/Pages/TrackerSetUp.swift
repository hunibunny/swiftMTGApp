//
//  TrackerSetUp.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import SwiftUI


struct TrackerSetUp: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var ammountOfPlayers = 0
    @State private var format = "Choose format"
    @State var presentPopup = false
    var body: some View {
        VStack{
            Text("Game settings")
            Menu(ammountOfPlayers == 0 ? "Ammount of players": String(ammountOfPlayers)){
                Button("4",action: {ammountOfPlayers = 4})
                Button("3",action: {ammountOfPlayers = 3})
                Button("2",action: {ammountOfPlayers = 2})
            }
            HStack{
                if ammountOfPlayers > 0{
                    ForEach(1...ammountOfPlayers, id: \.self){player in
                        Text("Profile")
                            .foregroundColor(Color.white)
                            .background(Rectangle().fill(Color.black))
                    }
                }
            }
            Menu(format){
                Button("Standard", action: {format = "Standard"})
                Button("Historic", action: {format = "Historic"})
                Button("Limited", action: {format = "Limited"})
                Button("Pioneer", action: {format = "Pioneer"})
                Button("Modern", action: {format = "Modern"})
                Button("Legacy", action: {format = "Legacy"})
                Button("Commander", action: {format = "Commander"})
                Button("Brawl", action: {format = "Brawl"})
                Button("Pauper", action: {format = "Pauper"})
            }
            Button("Start the game", action: {viewRouter.currentPage = .hpView})
        }
    }
}

struct TrackerSetUp_Previews: PreviewProvider {
    static var previews: some View {
        TrackerSetUp()
    }
}
