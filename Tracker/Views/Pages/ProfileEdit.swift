//
//  ProfileEdit.swift
//  Tracker
//
//  Created by Pirita Minkkinen on 10/3/22.
//

import SwiftUI

struct ProfileEdit: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var modelData: ModelData
    @State var testString = "Mle"
    @State var chosenTopColor: Color
    @State var chosenBottomColor: Color
    @State private var bgColor = Color.red
    @State var idealHeight: CGFloat?
    @State var name: String?
    @State var editedProfile: Profile?
    @State var editingProfile: Bool
    var body: some View {
        VStack{
            TextField("New Profile", text: $name.toUnwrapped(defaultValue: ""))
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
                changeProfileValues()
                modelData.viewRouter.currentPage = .profileList;
            }).defaultStyling()
            
            Button("Go back", action:{
                modelData.viewRouter.currentPage = .profileList}).defaultStyling()
        }
        .frame(maxHeight: UIScreen.screenHeight/2)
        .padding(.trailing)
    }
    
    func changeProfileValues(){
        modelData.editedProfile!.name = name
        modelData.editedProfile!.topDataColor = UIColor(chosenTopColor).encode;
        modelData.editedProfile!.bottomDataColor = UIColor(chosenBottomColor).encode;
        modelData.editedProfile!.alwaysPermament = true;
    }
}
