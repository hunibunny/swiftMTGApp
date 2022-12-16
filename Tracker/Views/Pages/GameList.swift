//
//  GameList.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

//geometry reader here too

struct GameList: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    @State var itemNumberToDelete = 0
    @State var itemToDelete: Game? = nil
    var body: some View {
        VStack{
            GeometryReader{geometry in
            ScrollView{
                ForEach(modelData.savedGames, id: \.self){game in
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                            .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        HStack(spacing: 0){
                            Text(game.gameName ?? "Unnamed Game").padding()
                            Spacer()
                            Button("Continue"){
                                modelData.currentGame = game
                                print(modelData.currentGame, "here")
                                modelData.viewRouter.currentPage = .counterView
                            }
                            .defaultStyling()
                            .fixedSize(horizontal: true, vertical: true)
                            Button("Delete"){
                                print("pressed delete")
                                showingAlert = true
                                //itemNumberToDelete = index
                                itemToDelete = modelData.savedGames[itemNumberToDelete]
                            }
                            .defaultStyling()
                            .fixedSize(horizontal: true, vertical: true)
                        
                            .alert("Do you want to delete this game?", isPresented: $showingAlert){
                                Button("Yes", action:{moc.delete(itemToDelete!);try! moc.save(); modelData.savedGames = loadGameData(moc: moc)})
                                    .defaultStyling()
                                Button("No", role: .cancel){}
                                    .defaultStyling()
                            }
                        }
                    }.frame(maxHeight: geometry.size.height/10)
                    
                }.frame(minHeight: geometry.size.height)
            }
            }
            .frame(alignment: .center)
            .padding(.leading, nil)
            .padding(.trailing, nil)
            Button("Back", action:{modelData.viewRouter.currentPage = .menuView}).defaultStyling()
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}
