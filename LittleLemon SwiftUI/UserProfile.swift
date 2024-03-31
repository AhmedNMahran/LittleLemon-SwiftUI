//
//  UserProfile.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 31/03/2024.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email: String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    /*
     This will automatically reference the presentation environment in SwiftUI which will allow you to reach the navigation logic.
     */
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
            Text(firstName)
            Text(lastName)
            Text(email)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                /*
                 When executed, it will automatically tell the NavigationView to go back to the previous screen which is Onboarding simulating logout.
                 */
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
