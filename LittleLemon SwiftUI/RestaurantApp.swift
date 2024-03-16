//
//  LittleLemon_SwiftUIApp.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 16/03/2024.
//

import SwiftUI

@main
struct RestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
