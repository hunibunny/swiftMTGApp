//
//  ProfileEdit.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

//make it so that new is created already earlier and this just changes the saving and display
struct ProfileEdit: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var testString = "Mle"
    @State var chosenTopColor: Color
    @State var chosenBottomColor: Color
    @State private var bgColor = Color.red
    @State var idealHeight: CGFloat?
    @State var name: String? = "New Profile"
    @State var editedProfile: Profile?
    @State var editingProfile: Bool
    var body: some View {
        VStack{
            TextField("Enter name here", text: $name.toUnwrapped(defaultValue: "New Profile"))
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
            Button("Save", action:{
                modelData.editingProfile ? changeValuesOfExistingProfile() : makeNewProfile()
                modelData.profiles.append(modelData.editedProfile)
                modelData.viewRouter.currentPage = .profileList;
            }).defaultStyling()
            
            Button("Go back", action:{
                modelData.viewRouter.currentPage = .profileList}).defaultStyling()
        }
        .frame(maxHeight: UIScreen.screenHeight/2)
        .padding(.trailing)
    }
    func changeValuesOfExistingProfile(){
        modelData.editedProfile.name = name
        //ok this is playway
    }
    func makeNewProfile(){
        modelData.editedProfile = createNewProfile(name: name, moc: moc, topColor: UIColor(chosenTopColor), bottomColor: UIColor(chosenBottomColor), alwaysPermament: true)
    }
}
