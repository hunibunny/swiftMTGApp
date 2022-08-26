//
//  AddAFriend.swift
//  MTGTracker
//
//  Created by Pirita on 12/08/2022.
//

import SwiftUI

struct AddAFriend: View {
    @EnvironmentObject var modelData: ModelData
    @State var names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    @State var searchboxHeight: CGFloat = 0
    var body: some View {
        GeometryReader{geometry in
            TextField("Search here", text: $searchText)
                .padding()
                .foregroundColor(Color.white)
                .background(RoundedRectangle(cornerSize: CGSize(width: 20,height: 20)).fill(.gray))
                .padding(.leading, 20)
                .padding(.trailing)
                .onAppear{
                    searchboxHeight = geometry.size.height
                }
        }
        VStack{
            
            ForEach(searchResults, id: \.self) { result in
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height:20))
                        .fill(Color.gray)
                    Text(result).searchCompletion(result)
                        .foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)).fill(Color.indigo))
                        .frame(alignment: .leading)
                        .padding()
                        .onTapGesture {
                            print("Added \(result) to friends")
                            modelData.profile.avaibleFriends.append(Profile(username: result))
                            names = names.filter{$0 != result}
                            print(names)
                        }
                        .border(.blue)
                }
                .padding(.trailing)
                .frame(maxHeight: searchboxHeight)
            }
        }
        .frame(minWidth: UIScreen.screenWidth-20, alignment: .leading)
        .border(Color.red, width: 2)
        .padding(.leading, 20)
        Button("Back", action: {
            modelData.inspectingSelf = true
            modelData.inspectedProfile = modelData.profile
            modelData.viewRouter.currentPage = .profileView
            })
        .defaultStyling()
            .frame(alignment: .topLeading)
            .padding()
    }
    

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}


struct AddAFriend_Previews: PreviewProvider {
    static var previews: some View {
        AddAFriend()
    }
}

/*
 .alert("Send friend request?", isPresented: $showingAlert){
     Button("Yes", action:{})
     Button("No", role: .cancel){}
 
 
 Button(action: {
     //chosing the friend owo
 }, label: {
     Text(String(self.avaibleFriendsForMe[index].username))
 })
 
 arcane barbarian honorbound assasin
 */
