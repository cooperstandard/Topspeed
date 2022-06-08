//
//  RaceList.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// Show all the historic and future races for a driver

import SwiftUI

struct RaceList: View {
    @Binding var user: User
    var body: some View {
        VStack{
            Text("Past Races: ")
                .padding()
            if user.past != nil {
                List(user.past!.sorted(by: <), id: \.motoID) { race in
                    NavigationLink("Moto id: \(race.motoID)", destination: RaceDetail(race: race))
                    
                }
            } else {
                Text("No Past Races to Display")
            }
            Spacer()
            Text("Future Races: ")
                .padding()
            if user.future != nil {
                List(user.future!.sorted(by: >), id: \.motoID) { race in
                    NavigationLink("Moto id: \(race.motoID)", destination: RaceDetail(race: race))
                    
                }
            } else {
                Text("No Future Races to Display")
            }
            
            
            
            
            
            
        }
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
    }
}

struct RaceList_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    static var previews: some View {
        RaceList(user: $user)
    }
}
