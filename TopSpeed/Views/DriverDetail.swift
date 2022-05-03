//
//  DriverDetailView.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// This should have all the details for the current driver

import SwiftUI

struct DriverDetailView: View {
    var body: some View {
        VStack {
            Text("Back")
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                
                
                
            VStack {
                //ScrollView {
                    //Text("photo here maybe")
                Image("blankProfile")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .aspectRatio(contentMode: .fit)
                    //Spacer()
                Text("Name")
                    .font(.title)
                    .fontWeight(.medium)
                Text("hometown")
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
                if (true) {
                    Text("next race \n(this comes later)")
                        .foregroundColor(.blue)
                }
                
                    
                //}
                
                Spacer()
            }
            .padding()
        }
        
    }
}

struct DriverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailView()
    }
}
