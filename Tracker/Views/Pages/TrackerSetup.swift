//
//  TrackerSetup.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//


import SwiftUI
import CoreData



struct TrackerSetUp: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    @State var maxHp: Double = 0
    @State var alert = ""
    @State var chosenPlayers = chosenProfiles()
    @State var twoPlayersChosen = false
    @State var threePlayersChosen = false
    @State var fourPlayersChosen = false
    @State var ammountOfPlayers: Int = 0
    @State var format: String? = nil
    @State var gameName: String? = ""
    var body: some View {
        VStack(spacing: nil){
            Text("Game settings").padding()
            TextField("Enter name here", text: $gameName.toUnwrapped(defaultValue: ""))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.blue)
            HStack{
                Button("2", action: {ammountOfPlayers = 2;})
                    .foregroundColor(ammountOfPlayers == 2 ? .indigo : nil)
                Button("3", action: {ammountOfPlayers = 3;})
                    .foregroundColor(ammountOfPlayers == 3 ? .indigo : nil)
                Button("4", action: {ammountOfPlayers = 4;})
                    .foregroundColor(ammountOfPlayers == 4 ? .indigo : nil)
            }
            .onChange(of: ammountOfPlayers, perform: {newValue in
                modelData.avaiablePlayers = chosenPlayers.empty(avaiablePlayers: modelData.avaiablePlayers)
                if(ammountOfPlayers == 4 || ammountOfPlayers == 3){
                    maxHp = 40
                }
                else if(ammountOfPlayers == 2){
                    maxHp = 20
                }
            })
            if ammountOfPlayers > 0{
                HStack{
                    ForEach(1...ammountOfPlayers, id: \.self){index in
                        ChosenProfile(chosenPlayers: $chosenPlayers, location: Int(index))
                    }
                }
            }
            Menu(format ?? "No format chosen"){
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
            
            Menu(String(Int(maxHp))){
                Button("10", action: {maxHp = 10})
                Button("20", action: {maxHp = 20})
                Button("30", action: {maxHp = 30})
                Button("40", action: {maxHp = 40})
            }
            Button("Start the game"){
                if(ammountOfPlayers > 0 && maxHp != 0){
                    chosenPlayers.fillToLength(fillTo: ammountOfPlayers, moc: moc)
                    var hpArray : Array<HealthPoint> = []
                    for index in 0..<ammountOfPlayers{
                        hpArray.append(HealthPoint(hp: maxHp, player: chosenPlayers.returnChosenPlayers()[index], moc: moc))
                    }
                    modelData.currentGame = createNewGame(moc: moc, players: chosenPlayers.returnChosenPlayers(), hp: maxHp, hpArray: hpArray, format: format)
                    modelData.viewRouter.currentPage = .counterView
                    
                }
                else{
                    if(ammountOfPlayers == 0){
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
