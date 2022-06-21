//
//  Crunchyroll_NativeApp.swift
//  Crunchyroll Native
//
//  Created by Valentine Briese on 6/17/22.
//

import SwiftUI

@main
struct Crunchyroll_NativeApp: App {
    #if os(macOS)
    @NSApplicationDelegateAdaptor private var appDelegate: Crunchyroll_NativeAppDelegate
    #endif
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            Crunchyroll_NativeView()
        }
        #if os(macOS)
        .windowToolbarStyle(.unified(showsTitle: false))
        #endif
    }
}

#if os(macOS)
class Crunchyroll_NativeAppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}
#endif
