//
//  MainMenu.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationView {
            NavigationLink("Profile") {
                RacerDetailView()
            }
        }
    }
//        .navigationTitle("Main Menu")
}
        


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
