//
//  AddAFriend.swift
//  MTGTracker
//
//  Created by Pirita on 12/08/2022.
//

import SwiftUI

extension Array {
    var lastest: Any {
        return self[self.endIndex - 1]
    }
}

struct ProfileEdit: View {
    //@Environment(\.managedObjectContext) var moc
    @EnvironmentObject var modelData: ModelData
    @State var testString = "Mle"
    @State var chosenTopColor: Color
    @State var chosenBottomColor: Color
    @State var name = "New profile"
    @State private var bgColor = Color.red
    @State var idealHeight: CGFloat?
    @State var editedProfile: Profile
    @State var editingProfile: Bool
    var body: some View {
        VStack{
            TextField("Enter name here", text: $name)
                .multilineTextAlignment(.center)
            HStack{
                VStack{
                    ColorPicker("Top color:", selection: $chosenTopColor, supportsOpacity: false)
                        .padding(.leading)
    
                    ColorPicker("Bottom color:", selection: $chosenBottomColor, supportsOpacity: false)
                        .padding(.leading)
                }
                ScreenButton(rotation: 0, topColor: UIColor(chosenTopColor), bottomColor: UIColor(chosenBottomColor), idealHeight: idealHeight, hp: 20)
            }
            Button("Save", action:{let len = modelData.profiles.count; modelData.profiles[len-1].name = name; modelData.profiles[len-1].topColor = UIColor(chosenTopColor); modelData.profiles[len-1].bottomColor = UIColor(chosenBottomColor); modelData.viewRouter.currentPage = .profileList;}).defaultStyling()
            Button("Go back", action:{if(editingProfile){
                
            } else{modelData.profiles.remove(at: modelData.profiles.count-1)};
                modelData.viewRouter.currentPage = .profileList}).defaultStyling()
        }
        .frame(maxHeight: UIScreen.screenHeight/2)
        .padding(.trailing)
    }
}
