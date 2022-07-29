//
//  NavigationStack.swift
//  MTGTracker
//
//  Created by Pirita on 28/07/2022.
//

import SwiftUI
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

struct ExampleOfAddingNewView: View {
@EnvironmentObject var state: NavigationStack
var body: some View {
        VStack {
            Button(action:{ self.state.push(state: .HpView) }){
            Text("Tap me")
        }

    }
}
}


struct ExampleOfRemovingView: View {
    @EnvironmentObject var state: NavigationStack
    var body: some View {
        VStack {
            Button(action:{ self.state.pop() }){
                Text("Tap me")
            }
        }
    }
}

