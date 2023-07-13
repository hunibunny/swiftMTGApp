//
//  GameList.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

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
                        GameScrollBlock(game: game)
                    }.frame(minHeight: geometry.size.height)
                }
                
            }
            .frame(alignment: .center)
            .padding(.leading, nil)
            .padding(.trailing, nil)
            GeometryReader{geometry in
                Color.red
                    .frame(width: geometry.frame(in: .global).width, height: geometry.frame(in: .global).height)
                Button("Back", action:{modelData.viewRouter.currentPage = .menuView}).defaultStyling(viewSize: geometry.frame(in: .global).size)
            }
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}
