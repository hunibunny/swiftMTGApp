//
//  TrackerSetup.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//


import SwiftUI
import CoreData

//lisaa niin etta kaikilla voi olla eri hp :)

func startGame(gameName: String, ammountOfPlayers: Int, maxHp: String? = nil, hpArray: Array<String>? = nil, format: String, chosenPlayers: chosenProfiles, moc: NSManagedObjectContext)->Game{
    print(ammountOfPlayers)
    chosenPlayers.fillToLength(fillTo: Int(ammountOfPlayers), moc: moc)
    let newGame = createNewGame(name: gameName, moc: moc, players: chosenPlayers.returnChosenPlayers(), hp: maxHp, hpArray: hpArray, format: format)
    //
    //modelData.currentGame!.playerArray = chosenPlayers.returnChosenPlayers()
    //modelData.currentGame!.players = chosenPlayers.returnChosenPlayers()
    print(newGame)
    //print(newGame.playerArray)
    //print(newGame.playerArray?.count)
    return newGame
}



struct TrackerSetUp: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var presentPopup = false
    @State var showingAlert = false
    @State var maxHp = "Max Hp"
    @State var alert = ""
    @State var chosenPlayers = chosenProfiles()
    @State var twoPlayersChosen = false
    @State var threePlayersChosen = false
    @State var fourPlayersChosen = false
    @State var ammountOfPlayers = 0
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
                    .foregroundColor(twoPlayersChosen ? .indigo : nil)
                Button("3", action: {ammountOfPlayers = 3;})
                    .foregroundColor(threePlayersChosen ? .indigo : nil)
                Button("4", action: {ammountOfPlayers = 4;})
                    .foregroundColor(fourPlayersChosen ? .indigo : nil)
            }
            .onChange(of: ammountOfPlayers, perform: {newValue in
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
            
            Menu(maxHp){
                Button("10", action: {maxHp = "10"})
                Button("20", action: {maxHp = "20"})
                Button("30", action: {maxHp = "30"})
                Button("40", action: {maxHp = "40"})
            }
            Button("Start the game"){
                if(ammountOfPlayers > 0 && maxHp != "0"){
                    //need to set up new game with settings from here :)
                    modelData.currentGame = startGame(gameName: gameName ?? "Unnamed", ammountOfPlayers: ammountOfPlayers, maxHp: maxHp, format: format ?? "no format", chosenPlayers: chosenPlayers, moc: moc)
                    modelData.currentGame?.ammountOfPlayers = Double(ammountOfPlayers)
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
