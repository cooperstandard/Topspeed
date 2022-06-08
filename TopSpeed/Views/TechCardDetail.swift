//
//  TechCardDetail.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// This should show all the details of the tech card

import SwiftUI

struct TechCardDetail: View {
    
    @Binding var user: User
    @State var tech: TechCard
    @State private var showAddScreen = false
    @State private var licenseNum = ""
    @State private var licenseExpr = ""
    
    func fillCard(user: User, tech: TechCard){
    // takes in a user profile and an empty tech card and fills it
    
        
    }
    var body: some View {
        

        VStack{
            HStack{
                Text("Racer Details").font(.title3)
                Spacer()
            }
            // set up if else to take components if they arent in a profile
            Text(user.racer!.racerName!)
            Text(user.racer!.racerAddress!)
            HStack{
                Text("License #:")
                TextField("Enter Text Here", text: $licenseNum)
                
            }
                //tech.licenseNum = licenseNum
            HStack{
                Text("License Exp:")
                TextField("Enter Text Here", text: $licenseExpr)
            }//tech.licenseExpr = licenseExpr
                
            
        
        }
        VStack{
            // make a popUp list
            Picker("Bike", selection: $tech.bike){
                if(user.bikes?.last?.id == 0) {
                    Text("No bikes found")
                        .font(.title)

                } else {
                    List(user.bikes!, id: \.id) {bike in
                        Text("\(bike.bikeManufacturer):Number  \(bike.bikeNum), Year \(bike.bikeYear) ")
                    }
                    
                }
    
            }.pickerStyle(.wheel)
        Spacer()
        }
    }
   
   
     //   .sheet(isPresented: $showAddScreen, content: BikeList)
    func saveLicense(techC: TechCard, licNum: String, licExp: String){
        // techC.licenseNum = licNum
        //techC.licenseExpr = licExp
    }


struct TechCardDetail_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    @State static var techCard = TechCard(racer: user.racer!)
    static var previews: some View {
        TechCardDetail(user:$user, tech: techCard)
    }
}
}
