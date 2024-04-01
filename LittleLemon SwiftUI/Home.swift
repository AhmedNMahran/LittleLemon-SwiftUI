//
//  Home.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 31/03/2024.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem { Label("Menu", image: "list.dish") }
            UserProfile().tabItem { Label("Profile", image: "square.and.pencil") }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
