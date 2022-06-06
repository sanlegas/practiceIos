//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by ISAAC DAVID SANTIAGO on 05/06/22.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
