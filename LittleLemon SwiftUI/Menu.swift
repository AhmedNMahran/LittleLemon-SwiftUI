//
//  Menu.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 31/03/2024.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            Text("Chicago")
                .font(.subheadline)
            Text("ldlskfjlksdjflksdjflksdfjlllskdfjlksdjflksdfjlskdfjlsfsldkfjlskdfjldsfkjfdsldkfjlskdfj")
            List(){
                
            }
        }
        
    }
}

#Preview {
    Menu()
}
