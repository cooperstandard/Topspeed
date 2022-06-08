//
//  BikeList.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/1/22.
//

import SwiftUI

struct BikeList: View {
    @Binding var user: User
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
        if(user.bikes?.last?.id == 0) {
            Text("No bikes found\nplease refresh or check back later")
                .font(.title)
                //.onAppear(perform: {print(user.bikes)})
            
            
        } else {
            
            List(user.bikes!, id: \.id) {bike in
                NavigationLink("\(bike.bikeManufacturer):Number  \(bike.bikeNum), Year \(bike.bikeYear) ", destination: BikeDetail(user: $user, bike: bike)) //year and manufacturer
                
            }
            
            
        }
        }
        Spacer()
        /*
            .toolbar {
                Button(action: { }, label: {
                    Label("Refresh Bikes",
                systemImage: "refresh"
                    )
                })
                Button (action: {
                   
                },label: {
                    Label("Add Bike",
                systemImage: "plus"
                    )
                })
        }
           */
    }
    //Handler.getBikes(user: user)
}

struct BikeList_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    static var previews: some View {
        BikeList(user: $user)
        }
    }


