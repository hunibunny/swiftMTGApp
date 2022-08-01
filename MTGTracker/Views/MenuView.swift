//
//  MenuView.swift
//  MTGTracker
//
//  Created by Pirita on 25/07/2022.
//


import SwiftUI
/*

import Combine

class NavigationStack: ObservableObject {
    let didChange = PassthroughSubject<Void, Never>()

    var list: [AuthState] = []

    public func push(state: AuthState) {
        list.append(state)
        didChange.send()
    }
    public func pop() {
        list.removeLast()
        didChange.send()
    }
}

enum AuthState {
    case MenuView
    case HpView
    case TrackerSetUp
}

struct NavigationRoot : View {
    @EnvironmentObject var state: NavigationStack
    @State private var aligment = Alignment.leading

    fileprivate func CurrentView() -> some View {
        switch state.list.last {
        case .MenuView:
            return AnyView(MenuView())
        case .none:
            return AnyView(TrackerSetUp().environmentObject(state))
        default:
            return AnyView(hpView().environmentObject(state))
        }
    }
    var body: some View {
    GeometryReader { geometry in
        self.CurrentView()
            .background(Image("background")
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height,
                       alignment: self.aligment))
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation() {
                        switch self.state.list.last {
                        case .none:
                                self.aligment = Alignment.leading
                        case .HpView:
                                self.aligment = Alignment.trailing
                        default:
                                self.aligment = Alignment.center
                        }
                    }
                }
            }
        .background(Color.black)
    }

}
*/

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
 //   @EnvironmentObject var state: NavigationStack
    @State var inMenus = true
   // MenuView().environmentObject(NavigationStack)
  /*
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    */
    var body: some View {
        VStack{
       //     NavigationRoot()
        }
        .onAppear(){
            print("displaying MenuView")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

/*
 
 NavigationLink(destination: hpView()){
     Text("Go to hpView")
 }
 
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
