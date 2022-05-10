//
//  DriverDetailView.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// This should have all the details for the current driver

import SwiftUI

struct RacerDetailView: View {
    var body: some View {
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
            
            //Text(callAPI())
            
                
            //}
            
            Spacer()
        }
        //.padding()
    }
        
    
}

struct DriverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RacerDetailView()
    }
}
