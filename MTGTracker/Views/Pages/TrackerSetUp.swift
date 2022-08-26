//
//  TrackerSetUp.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import SwiftUI


struct TrackerSetUp: View {
    @EnvironmentObject var modelData: ModelData
    @State var presentPopup = false
    @State var showingAlert = false
    @State var maxHp = "Max Hp"
    @State var alert = ""
    @State var originalPossibilities = ModelData().profile.avaibleFriends
    var body: some View {
        VStack(spacing: nil){
            Text("Game settings").padding()
            Menu(modelData.currentGame!.ammountOfPlayers == 0 ? "Ammount of players": String(modelData.currentGame!.ammountOfPlayers)){
                Button("4",action: {modelData.currentGame!.ammountOfPlayers = 4})
                Button("3",
                       action: {
                    modelData.currentGame!.ammountOfPlayers = 3;
                    if(modelData.profile.chosenFriends.count == 4){
                        modelData.profile.avaibleFriends.append(modelData.profile.chosenFriends[-1])
                        modelData.profile.chosenFriends = Array(modelData.profile.chosenFriends[0..<modelData.currentGame!.ammountOfPlayers])
                }})
                Button("2",
                       action: {
                    modelData.currentGame!.ammountOfPlayers = 2
                    if(modelData.profile.chosenFriends.count == 4){
                        modelData.profile.avaibleFriends += modelData.profile.chosenFriends[2...3]
                        modelData.profile.chosenFriends = Array(modelData.profile.chosenFriends[0..<modelData.currentGame!.ammountOfPlayers])
                    }
                    else if(modelData.profile.chosenFriends.count == 3){
                        modelData.profile.avaibleFriends.append(modelData.profile.chosenFriends[2])
                        modelData.profile.chosenFriends = Array(modelData.profile.chosenFriends[0..<modelData.currentGame!.ammountOfPlayers])
                    }
                })
            }
            .onChange(of: modelData.currentGame!.ammountOfPlayers, perform: {newValue in
                for player in originalPossibilities{
                    if(!modelData.currentGame!.players.contains(player) && !modelData.profile.avaibleFriends.contains(player)){
                        modelData.profile.avaibleFriends.append(player)
                    }
                }
            })
            if modelData.currentGame!.ammountOfPlayers > 0{
                HStack{
                    ForEach(1...modelData.currentGame!.ammountOfPlayers, id: \.self){index in
                        ProfileSpot()
                    }
                }
            }
            Menu(modelData.currentGame!.format){
                Button("Standard", action: {modelData.currentGame!.format = "Standard"})
                Button("Historic", action: {modelData.currentGame!.format = "Historic"})
                Button("Limited", action: {modelData.currentGame!.format = "Limited"})
                Button("Pioneer", action: {modelData.currentGame!.format = "Pioneer"})
                Button("Modern", action: {modelData.currentGame!.format = "Modern"})
                Button("Legacy", action: {modelData.currentGame!.format = "Legacy"})
                Button("Commander", action: {modelData.currentGame!.format = "Commander"})
                Button("Brawl", action: {modelData.currentGame!.format = "Brawl"})
                Button("Pauper", action: {modelData.currentGame!.format = "Pauper"})
            }
            
            Menu(maxHp){
                Button("10", action: {maxHp = "10"})
                Button("20", action: {maxHp = "20"})
                Button("30", action: {maxHp = "30"})
                Button("40", action: {maxHp = "40"})
            }
            .onChange(of: maxHp, perform: {newValue in
                let helpArray: Array<Int> = [Int(newValue) ?? 0 , Int(newValue) ?? 0, Int(newValue) ?? 0, Int(newValue) ?? 0]
                modelData.currentGame!.hp = helpArray
                
            })
            Button("Start the game"){
                if(modelData.currentGame!.ammountOfPlayers > 0 && modelData.currentGame!.hp[0] != 0){
                    modelData.currentGame!.players.append(Profile(username: "Guest 1"))
                    modelData.currentGame!.players.append(Profile(username: "Guest 2"))
                    modelData.currentGame!.players.append(Profile(username: "Guest 3"))
                    modelData.currentGame!.players.append(Profile(username: "Guest 4"))
                    modelData.viewRouter.currentPage = .hpView
                }
                else{
                    if(modelData.currentGame!.ammountOfPlayers == 0){
                        alert = "Choose ammount of players"
                    }
                    else{
                        alert = "Choose max hp"
                    }
                    showingAlert = true
                }
                    
            }
            .defaultStyling()
            .alert(alert, isPresented: $showingAlert){
                Button("Ok", role: .cancel){}
            }
           
        }
        Button("Back", action: {modelData.viewRouter.currentPage = .menuView}).defaultStyling()
            .frame(alignment: .bottom)
    }
}

struct TrackerSetUp_Previews: PreviewProvider {
    static var previews: some View {
        TrackerSetUp()
    }
}
