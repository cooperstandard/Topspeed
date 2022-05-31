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
    init() {
        user = User(email: "test_user@test.com", pass: "password")
        
    }
    
    @State var loggedIn : Bool = true;
    @State var user: User;
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if loggedIn {
                    MainMenu(user: user)
                } else  {
                    LogIn()
                }
                
                    
            }
            .preferredColorScheme(.light)
            
        }
    }
}
