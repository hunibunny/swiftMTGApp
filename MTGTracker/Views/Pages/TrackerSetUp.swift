//
//  TrackerSetUp.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import SwiftUI


struct TrackerSetUp: View {
    @EnvironmentObject var modelData: ModelData
    @State private var ammountOfPlayers = 0
    @State private var format = "Choose format"
    @State var presentPopup = false
    @State var friendDictionary: Dictionary<String, Int> = [:]
    @State var showingAlert = false
    var body: some View {
        VStack{
            Text("Game settings")
            Menu(ammountOfPlayers == 0 ? "Ammount of players": String(ammountOfPlayers)){
                Button("4",action: {ammountOfPlayers = 4})
                Button("3",
                       action: {
                    ammountOfPlayers = 3;
                    if(modelData.profile.chosenFriends.count == 4){
                        modelData.profile.avaibleFriends.append(modelData.profile.chosenFriends[-1])
                        modelData.profile.chosenFriends = Array(modelData.profile.chosenFriends[0..<ammountOfPlayers])
                }})
                Button("2",
                       action: {
                    ammountOfPlayers = 2
                    if(modelData.profile.chosenFriends.count == 4){
                        modelData.profile.avaibleFriends += modelData.profile.chosenFriends[2...3]
                        modelData.profile.chosenFriends = Array(modelData.profile.chosenFriends[0..<ammountOfPlayers])
                    }
                    else if(modelData.profile.chosenFriends.count == 3){
                        modelData.profile.avaibleFriends.append(modelData.profile.chosenFriends[2])
                        modelData.profile.chosenFriends = Array(modelData.profile.chosenFriends[0..<ammountOfPlayers])
                    }
                })
            }
            HStack{
                if ammountOfPlayers > 0{
                    ForEach(1...ammountOfPlayers, id: \.self){index in
                        ProfileSpot()
                        //friendDictionary[viewRouter.chosenFriend] = index-1

                    }
                }
               
            }
            .onAppear(){
                if modelData.profile.chosenFriends.count > ammountOfPlayers{
                    
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
            Button("Start the game"){
                if(ammountOfPlayers > 0){
                    modelData.gameSettings.gameMode = format
                    modelData.gameSettings.ammountOfPlayers = ammountOfPlayers
                    modelData.viewRouter.currentPage = .hpView
                }
                else{
                    showingAlert = true
                    }
                    
            }
            .defaultStyling()
            .alert("Choose the ammount of players", isPresented: $showingAlert){
                Button("Ok", role: .cancel){}
            }
        }
        .onChange(of: ammountOfPlayers){newValue in 
            
        }
    }
        
}

struct TrackerSetUp_Previews: PreviewProvider {
    static var previews: some View {
        TrackerSetUp()
    }
}
