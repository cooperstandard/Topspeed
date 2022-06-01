//
//  DriverDetailView.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// This should have all the details for the current driver

import SwiftUI
import Combine

struct RacerDetailView: View {
    @Binding var user : User
    var body: some View {
        VStack {
            //ScrollView {
                //Text("photo here maybe")
            Image("blankProfile")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .aspectRatio(contentMode: .fit)
                //Spacer()
            HStack {
                Text("Name: ")
                    .font(.title)
                    .fontWeight(.medium)
                Text(user.racer!.racerName!)
            }
            Text("Hometown")
                .font(.title2)
            Text("phone number")
                .font(.title2)
            Text("email")
                .font(.title2)
            Text("wins")
                .font(.title2)
            Text("loses")
                .font(.title2)
            Spacer()
        
             
            
            
            
                
            
            Spacer()
        }
        //.padding()
    }
        
    
}

struct DriverDetailView_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    static var previews: some View {
        RacerDetailView(user: $user)
    }
}
