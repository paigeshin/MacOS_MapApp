//
//  SideBar.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI

struct SideBar: View {
    
    @EnvironmentObject private var appState: AppState
    private var vm = SearchResultsViewModel()
    @State private var search = ""
    
    var body: some View {
        VStack {
            SearchResultList(places: self.appState.places)
        } //: VStack
        .searchable(
            text: self.$search,
            placement: .sidebar,
            prompt: "Search Maps"
        )
        .onChange(of: self.search) { _, newValue in
            self.vm.search(text: newValue, completion: { annotations in
                self.appState.places = annotations
            })
        }
        .padding()
    } //: body
}

#Preview {
    SideBar()
}
