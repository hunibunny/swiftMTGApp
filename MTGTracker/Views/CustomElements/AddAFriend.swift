//
//  AddAFriend.swift
//  MTGTracker
//
//  Created by Pirita on 12/08/2022.
//

import SwiftUI

struct AddAFriend: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            Text("Searching for \(searchText)")
                       .searchable(text: $searchText)
                       .navigationTitle("Searchable Example")
               }
    }
}

struct AddAFriend_Previews: PreviewProvider {
    static var previews: some View {
        AddAFriend()
    }
}
