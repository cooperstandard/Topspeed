//
//  TopSpeedApp.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

import SwiftUI
import Combine

@main
struct TopSpeedApp: App {
    //App fatally crashes if invalid credentials are given for username and password.
    init() {
        user = User(id: "")
        
        
    }
    
    @State var loggedIn : Bool = false;
    @State var user: User;
    
    var body: some Scene {
        WindowGroup {
            if loggedIn {
                MainMenu(user: $user)
                    .preferredColorScheme(.light)
            } else  {
                LogIn(user: $user, loggedIn: $loggedIn)
                    .preferredColorScheme(.light)
                    
            }
                
                    
        }
    }
}
