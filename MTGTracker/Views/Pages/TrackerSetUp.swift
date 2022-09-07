//
//  TrackerSetUp.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import SwiftUI


struct TrackerSetUp: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var modelData: ModelData
    @State var presentPopup = false
    @State var showingAlert = false
    @State var maxHp = "Max Hp"
    @State var alert = ""
    @State var chosenPlayers = chosenProfiles()
    @State var twoPlayersChosen = false
    @State var threePlayersChosen = false
    @State var fourPlayersChosen = false
    var body: some View {
        VStack(spacing: nil){
            Text("Game settings").padding()
            Text("Ammount of players: ").padding()
            HStack{
                Button("4", action: {modelData.currentGame!.ammountOfPlayers = 4;})
                    .foregroundColor(fourPlayersChosen ? .indigo : nil)
                Button("3", action: {modelData.currentGame!.ammountOfPlayers = 3;})
                    .foregroundColor(threePlayersChosen ? .indigo : nil)
                Button("2", action: {modelData.currentGame!.ammountOfPlayers = 2;})
                    .foregroundColor(twoPlayersChosen ? .indigo : nil)
            }
            .onChange(of: modelData.currentGame!.ammountOfPlayers, perform: {newValue in
                chosenPlayers.empty()
                if(newValue == 4){
                    fourPlayersChosen = true
                    threePlayersChosen = false
                    twoPlayersChosen = false
                    maxHp = "40"
                }
                else if(newValue == 3){
                    fourPlayersChosen = false
                    threePlayersChosen = true
                    twoPlayersChosen = false
                    maxHp = "40"
                }
                else if(newValue == 2){
                    fourPlayersChosen = false
                    threePlayersChosen = false
                    twoPlayersChosen = true
                    maxHp = "20"
                }
            })
            if modelData.currentGame!.ammountOfPlayers > 0{
                HStack{
                    ForEach(1...modelData.currentGame!.ammountOfPlayers, id: \.self){index in
                        ChosenProfile(chosenPlayers: $chosenPlayers, location: index)
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
                    chosenPlayers.fillToLength(fillTo: modelData.currentGame!.ammountOfPlayers, moc: moc)
                    modelData.currentGame!.players = chosenPlayers.returnChosenPlayers()
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
