//
//  ContentView.swift
//  MTGTracker
//
//  Created by Pirita on 06/07/2022.
//

import SwiftUI


struct AddANewView: View {
//    @EnvironmentObject var state: NavigationStack
    var body: some View {
        VStack {
     //       Rectangle()
      //          Color.red
         //       .onTapGesture{
           //         self.state.push(state: .hpView)
             //       print("tried to add new member")
            }
            Text("Tap me")
      //      Button(action: {print(self.state.list)}){
            Text("Button")
            }
        }

    }
}



struct ContentView: View {
    //@EnvironmentObject var state: NavigationStack
    //@StateObject var state = NavigationStack()
    var body: some View {
        Text("ContentView")
    //    AddANewView()
     //       .environmentObject(NavigationStack())
      //  NavigationRoot()
     //       .environmentObject(NavigationStack())
       // NavigationView{
            //MenuView()
        //hpView()
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
