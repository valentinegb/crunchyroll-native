//
//  Crunchyroll_NativeApp.swift
//  Crunchyroll Native
//
//  Created by Valentine Briese on 6/17/22.
//

import SwiftUI

@main
struct Crunchyroll_NativeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
