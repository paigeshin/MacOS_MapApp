//
//  MyMapsApp.swift
//  MyMaps
//
//  Created by paige shin on 10/20/23.
//

import SwiftUI

@main
struct MyMapsApp: App {
    var body: some Scene {
        WindowGroup {
            let appState = AppState()
            HomeScreen()
                .frame(minWidth: 1280, minHeight: 720)
                .environmentObject(appState)
        }
    }
}
