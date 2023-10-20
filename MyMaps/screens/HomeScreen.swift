//
//  HomeScreen.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBar()
                .frame(minWidth: 300)
            MapScreen()
        } //: NavigationView
    } //: body
}

#Preview {
    HomeScreen()
}
