//
//  GameList.swift
//  MTGTracker
//
//  Created by Pirita on 01/09/2022.
//

import SwiftUI

struct GameList: View {
    @EnvironmentObject var modelData: ModelData
    @State var showingAlert = false
    @State var itemNumberToDelete = 0
    var body: some View {
        VStack{
            GeometryReader{geometry in
            ScrollView{
                ForEach(0..<modelData.savedGames.count, id: \.self){index in
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width:20, height:20))
                            .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        HStack{
                            Text(modelData.savedGames[index].name!).padding()
                            Spacer()
                            Button("Continue this game"){
                                modelData.currentGame = modelData.savedGames[index]
                                modelData.viewRouter.currentPage = .hpView
                            }
                            .defaultStyling()
                            Button("Delete"){
                                showingAlert = true
                                itemNumberToDelete = index
                            }
                            .defaultStyling()
                        
                            .alert("Do you want to delete this game?", isPresented: $showingAlert){
                                Button("Yes", action:{modelData.savedGames.remove(at: itemNumberToDelete)})
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
                .onAppear{
                    print(modelData.savedGames.count)
                }
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}
