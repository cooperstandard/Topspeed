//
//  SignUp.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/7/22.
//

import SwiftUI

struct SignUp: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    
    @Binding var user: User
    @Binding var loggedIn: Bool
   
    
    var body: some View {
        VStack {
            Text("Sign Up!")
                .font(.title)
            HStack {
                Text("Name")
                TextField("type here", text: $name)
                    .textContentType(.password)
                    .autocapitalization(.none)
                    .padding()
                    .border(Color(UIColor.separator))
            }.padding()
            HStack {
                Text("Email ")
                TextField("type here", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .border(Color(UIColor.separator))
            }.padding()
            
            HStack {
                Text("Password ")
                TextField("type here", text: $password)
                    .textContentType(.password)
                    .autocapitalization(.none)
                    .padding()
                    .border(Color(UIColor.separator))
            }.padding()
            
            
            
            Button(action: {
                user.id = email
                Handler.register(email: email, pass: password, name: name)
                loggedIn.toggle()
                
            }) {
                Text("Sign Up")
            }
          
        
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    @State static var user = User(id: "")
    @State static var loggedIn = false

    static var previews: some View {
        SignUp(user: $user, loggedIn: $loggedIn)
    }
}
