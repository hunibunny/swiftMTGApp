//
//  MenuView.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//

import SwiftUI






//import NavigationStack

/*
struct RootView: View{
    let navigationStack: NavigationStack
    
    var body: some View{
        NavigationStackView(navigationStack: navigationStack){
            MenuView()
        }
    }
}

class NavigationRouter{
    private let navStack: NavigationStack
    
    init(navStack: NavigationStack){
        self.navStack = navStack
    }
    
    func toTrackerSetUp() {
        self.navStack.push(TrackerSetUp())
    }


}



extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    }
}*/

struct MenuView: View {
    @State var inMenus = true
  /*
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    */
    var body: some View {
        NavigationLink(destination: hpView()){
            Text("Go to hpView")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

/*
 if inMenus{
     Button("Track a Game"){
         inMenus = false
         //NavigationRouter.toTrackerSetUp()
     }
 }
 else{
    hpView()
     
 }
 
 NavigationView{
     NavigationLink("hpView", destination: hpView().navigationBarBackButtonHidden(true))
     Text("Go to tracker")
     
 }
 //.navigationTitle("Navigation title")
 
 */
