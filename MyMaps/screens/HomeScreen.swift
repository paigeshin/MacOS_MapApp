//
//  HomeScreen.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @AppStorage("useLightMap") var useLightMap = false
    
    var body: some View {
        NavigationView {
            Group {
                SideBar()
                    .frame(minWidth: 300)
                MapScreen()
            } //: Group
            .preferredColorScheme(self.useLightMap ? .light : .dark)
        } //: NavigationView
    } //: body
}

#Preview {
    HomeScreen()
}
