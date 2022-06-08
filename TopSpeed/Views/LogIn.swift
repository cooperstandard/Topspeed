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
        Spacer()
        VStack {
            Text("Log In")
                .font(.title).padding(.top).padding(.top)
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
            // sign in uses their token
            Button(action: {
                user.id = email
                Handler.signIn(email: email, pass: password, user: user)
                loggedIn.toggle()
                
            }) {
                Text("Sign in")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.cornerRadius(10))
                .foregroundColor(.white)
                .font(.headline)
            }.padding().padding(.bottom)
            Spacer()
            
            
            //sign up button at the bottom logs a new user
            Button(action:{
                NavigationLink("Sign up", destination: SignUp(user: $user, loggedIn: $loggedIn))
                
            }){
                    
                    Text("Sign up")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding()
            
          
        
            
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
