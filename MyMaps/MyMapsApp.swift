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
        .commands {
            CommandGroup(after: .appInfo) {
                Button("Preferences") {
                    PreferencesScreen()
                        .openInWindow(title: "Preferences", sender: self)
                }
            }
        }
    }
}

extension View {
 
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let window = NSWindow(contentViewController: controller)
        window.contentViewController = controller
        window.title = title
        window.makeKeyAndOrderFront(sender)
        return window
    }
    
}
