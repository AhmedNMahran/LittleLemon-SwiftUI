//
//  Onboarding.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 31/03/2024.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

struct Onboarding: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String = ""

    var body: some View {
        VStack(alignment: .center) {
            TextField("First Name",text: $firstName)
            TextField("Last Name",text: $lastName)
            TextField("Email",text: $email)
            Button(action: {
                
                if firstName.isEmpty
                    || lastName.isEmpty
                    || email.isEmpty
                
                {
                    
                } else {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                }
                
            }, label: {Text("Register")})
        }.padding()
    }
}

#Preview {
    Onboarding()
}
