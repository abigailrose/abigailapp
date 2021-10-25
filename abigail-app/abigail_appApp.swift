//
//  abigail_appApp.swift
//  abigail-app
//
//  Created by Abigail Fox on 10/25/21.
//

import SwiftUI

@main
struct abigail_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
