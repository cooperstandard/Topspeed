//
//  LogInView.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/27/22.
//

import SwiftUI

struct LogIn: View {
    //For testing I have the test values already loaded. For real use set these to be empty Strings
    @State private var email = "test_"
    @State private var password = "password"
    
    
    @Binding var user: User
    @Binding var loggedIn: Bool
   
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.title)
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
                Handler.signIn(email: email, pass: password, user: user)
                loggedIn.toggle()
                
            }) {
                Text("Sign in")
            }
        
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    @State static var user = User(id: "")
    @State static var loggedIn = false
    static var previews: some View {
        
        LogIn(user: $user, loggedIn: $loggedIn)
    
    }
}
