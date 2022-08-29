//
//  AddAFriend.swift
//  MTGTracker
//
//  Created by Pirita on 12/08/2022.
//

import SwiftUI

struct AddAFriend: View {
    @EnvironmentObject var modelData: ModelData
    @State var testString = "Mle"
    @State var chosenTopColor = Color.white
    @State var chosenBottomColor = Color.white
    @State var name = "New profile"
    @State private var bgColor = Color.red
    @State var idealHeight: CGFloat?
    var body: some View {
        VStack{
            TextField("Enter name here", text: $name)
                .multilineTextAlignment(.center)
            HStack{
                VStack{
                    Text("Top color:")
                    ColorPicker("Set color", selection: $chosenTopColor, supportsOpacity: false)
                        .padding(.leading)
                    
                    Text("Bottom color")
                    ColorPicker("Set color", selection: $chosenBottomColor, supportsOpacity: false)
                        .padding(.leading)
                }
                ScreenButton(rotation: 0, topColor: UIColor(chosenTopColor), bottomColor: UIColor(chosenBottomColor), idealHeight: idealHeight, hp: 20)
            }
            Button("Save", action:{})
            Button("Go back", action:{modelData.viewRouter.currentPage = .profileView}).defaultStyling()
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
